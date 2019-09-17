var _gd
var _show = true

init()


function init() {
  initLog()

  $('body').on('click','.m-detail',doDetail)
  $('body').on('click','.m-return',doReturn)
  $('body').on('click','.m-tap-type',doShowGrapy)
  $('body').on('click','.m-btn-trigger',doTrigger)
}

function refreshGrapy() {
  $('.m-graph-item').empty()
  typeGrapy(_gd.typeData)
  wordGrapy(_gd.wordData)
  timeGrapy(_gd.timeData)
}

function doTrigger(e) {
  if (_show) {
    $('.m-log-bs').addClass('hide')
    $('.m-log-dl').addClass('hide')
  }else{
    $('.m-log-bs').removeClass('hide')
    $('.m-log-dl').removeClass('hide')
  }
  _show = !_show
  refreshGrapy()
}

function doShowGrapy(e) {
  let index = $(e.currentTarget).index()
  $('.m-graph-item').addClass('hide')
  $($('.m-graph').find('.m-graph-item')[index]).removeClass('hide')
  
  refreshGrapy()
}

function doReturn() {
  window.location = 'index.html'
}

function doDetail(e) {
  let id = $(e.currentTarget).attr('data-id')
  let data = { id:id }

  promiseTmpl('post','/tmpl/logdetail.tmpl','/logdetail',JSON.stringify(data), true, (r,e)=>{
    if (e.code === 200) {
      $('.m-log-detail').empty()
      $('.m-log-detail').append($.templates(r).render(e.data, rdHelper))
      
      let COUNT = e.data.logdetail.length
      let SIZE = 10
      if (COUNT > SIZE) {
        let items = $('.m-row-detail');
        items.slice(SIZE).hide();

        $('#log-detail-page').pagination({
          items: COUNT,
          itemsOnPage: SIZE,
          prevText: '&laquo;',
          nextText: '&raquo;',
          hrefTextPrefix: '#',
          onPageClick: function (pageNumber) {
            var showFrom = SIZE * (pageNumber - 1);
            var showTo = showFrom + SIZE;
            items.hide().slice(showFrom, showTo).show();
          }
        })
      }

      $('#cost-time').text(e.data.data.basicData.dure)
      $('#cost-count').text(e.data.data.basicData.count)

      _gd = e.data.data
      typeGrapy(e.data.data.typeData)
      wordGrapy(e.data.data.wordData)
      timeGrapy(e.data.data.timeData)

    }else{
      toastr.error('取log失败！');
    }
  })
}


function initLog() {
  account = JSON.parse(window.localStorage.getItem('EWORD_USER'))
  let data = { code:account.code }

  promiseTmpl('post','/tmpl/log.tmpl','/loglist',JSON.stringify(data), true, (r,e)=>{
    if (e.code === 200) {
      $('.m-log-list').empty()
      $('.m-log-list').append($.templates(r).render(e.data, rdHelper))
      
      let COUNT = e.data.log.length
      let SIZE = 7
      let items = $('.m-row');
      items.slice(SIZE).hide();

      $('#log-page').pagination({
        items: COUNT,
        itemsOnPage: SIZE,
        prevText: '&laquo;',
        nextText: '&raquo;',
        hrefTextPrefix: '#',
        onPageClick: function (pageNumber) {
          var showFrom = SIZE * (pageNumber - 1);
          var showTo = showFrom + SIZE;
          items.hide().slice(showFrom, showTo).show();
        }
      });
    }else{
      toastr.error('取log失败！');
    }
  })
}


function timeGrapy(data) {

Highcharts.chart('cont-time', {
    chart: {
        type: 'bar'
    },
    title: {
        text: '操作时间图'
    },
    xAxis: {
        type: 'category',
        labels: {
            rotation: -45  // 设置轴标签旋转角度
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: '操作时间 (秒)'
        }
    },
    legend: {
        enabled: false
    },
    tooltip: {
        pointFormat: '操作时长: <b>{point.y:.0f} 秒</b>'
    },
    series: [{
        name: '总人口',
        data: data,
        dataLabels: {
            enabled: true,
            rotation: -90,
            color: '#FFFFFF',
            align: 'right',
            format: '{point.y:.1f}', // :.1f 为保留 1 位小数
            y: 10
        }
    }]
});


}


function wordGrapy(data) {
  Highcharts.chart('cont-word', {
    chart: {
      type: 'column'
    },
    title: {
      text: '单词频率图'
    },
    xAxis: {
      categories: data.wordDataT
    },
    yAxis: {
      min: 0,
      title: {
          text: '单词操作次数'
      },
      stackLabels: {
        enabled: true,
        style: {
          fontWeight: 'bold',
          color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
        }
      }
    },
    legend: {
      reversed: true 
    },
    plotOptions: {
      column: {
        stacking: 'normal',
        dataLabels: {
          enabled: true,
          color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
          style: {
            // 如果不需要数据标签阴影，可以将 textOutline 设置为 'none'
            textOutline: '1px 1px black'
          }
        }
      }
    },
    series: data.wordDataD
  })
}

function typeGrapy(data) {
  Highcharts.chart('cont-act', {
    chart: {
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false,
      type: 'pie'
    },
    title: {
      text: '操作次数统计图'
    },
    tooltip: {
      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
      pie: {
        allowPointSelect: true,
        cursor: 'pointer',
        dataLabels: {
          enabled: true,
          format: '<b>{point.name}</b>[{point.y}]: {point.percentage:.1f}%: ',
          style: {
            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
          }
        }
      }
    },
    series: [{
      name: 'Brands',
      data: data
    }]
  })
}







