{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template %}

  {% block title %}{#
  #}{% set page_title_suffix = ' | ' + config.title %}{#

  #}{% if page.type === "categories" and not page.title %}{#
    #}{{ __('title.category') + page_title_suffix }}{#
  #}{% elif page.type === "tags" and not page.title %}{#
    #}{{ __('title.tag') + page_title_suffix }}{#
  #}{% elif page.type === "links" and not page.title %}{#
    #}{{ __('title.links') + page_title_suffix }}{#
  #}{% else %}{#
    #}{{ page.title + page_title_suffix }}{#
  #}{% endif %}{#
#}{% endblock %}

{% block page_class %}page-post-detail{% endblock %}

{% block content %}

  <div id="posts" class="post posts-expand">
    {##################}
    {### PAGE BLOCK ###}
    {##################}
    <div class="post-block page">
      {% include '_partials/page-header.swig' %}
      {#################}
      {### PAGE BODY ###}
      {#################}
      <div class="post-body{% if theme.han %} han-init-context{% endif %}{% if page.direction && page.direction.toLowerCase() === 'rtl' %} rtl{% endif %}">
        {# tagcloud page support #}
        {% if page.type === "tags" %}
          <div class="tag-cloud">
            <div class="tag-cloud-title">
                {{ _p('counter.tag_cloud', site.tags.length) }}
            </div>
            <div class="tag-cloud-tags">
              {{ tagcloud({min_font: 12, max_font: 30, amount: 300, color: true, start_color: '#ccc', end_color: '#111'}) }}
            </div>
          </div>

          <hr/>
    
          <blockquote>
            <p>每个人一生中，都会经历很多次单枪匹马的战斗，有些路只能一个人走，但当你回头望，总会发现有人守在不远处，不言语，但就在那里。</p>
          </blockquote>
          
          <blockquote>
            <p>能够有几个知冷知热，懂你悲喜的人，不管是亲人、朋友、爱人，都会让这漫漫一生，变得格外温暖。</p>
          </blockquote>
          
          <blockquote>
            <p><strong>有人说，人一生会遇到约2920万人，我们经历的大部分遇见都是擦肩而过，有些人只是表面的客套和寒暄，而有些人却是真正知根知底，交心交情。</strong></p>
          </blockquote>
          
          <blockquote>
            <p>大多数人只关心你飞得高不高，只有几个真正懂你的人，会在意你过得好不好，会看到你的辛苦和付出，心疼你的不容易。</p>
          </blockquote>
          
          <blockquote>
            <p>有些苦难必须一个人咬着牙熬过去，但能够有人在你脆弱想哭的时候听你吐槽，给你拥抱，陪你一起消化掉那些负能量，就像是黑夜中一盏温暖的灯光，让你积蓄起继续前行的力量。</p>
          </blockquote>
          
          <blockquote>
            <p><strong>遇见容易相守难，欢喜容易懂得难。</strong></p>
          </blockquote>

          <blockquote>
            <p>这一生最难得的，不是有人爱你，而是有人真正懂你，懂你的心事，懂你的沉默，也懂你的欲言又止。</p>
          </blockquote>
          
          <blockquote>
            <p><strong>最好的关系，其实就两个字-懂得～</strong></p>
          </blockquote>
          
          <blockquote>
            <p><strong>人和人之间，不过一世的缘分，和懂你的人在一起，才不负人生一场。</strong></p>
          </blockquote>
          
          <blockquote>
            <p><strong>心比长相好，懂比爱重要，不要消耗浪费自己的真心和感情，留给值得的人，才有意义。</strong></p>
          </blockquote>
          
          <blockquote>
            <p><strong>不必将就，努力做你自己，前行的路上，总会遇到和你志同道合的同路者。</strong></p>
          </blockquote>
          
          <blockquote>
            <p><strong>愿余生，我们都能找到合适自己的人，彼此懂得，过上舒心自在的日子。</strong></p>
          </blockquote>

        {% elif page.type === 'categories' %}
          <div class="category-all-page">
            <div class="category-all-title">
                {{ _p('counter.categories', site.categories.length) }}
            </div>
            <div class="category-all">
              {{ list_categories() }}
            </div>
          </div>

          <hr/>

          <blockquote>
            <p><strong>别在最能吃苦的年纪选择了安逸</strong></p>
          </blockquote>

          <blockquote>
            <p>亲爱的朋友，如果老天善待你，给了你优越的生活，请不要收敛了自己的斗志；如果老天对你百般设障，请不要磨灭了对自己的信心和向前奋斗的勇气</p>
          </blockquote>
          
          <blockquote>
            <p>当你想要放弃了，一定要想想那些睡得比你晚、起得比你早、跑得比你卖力、天赋还比你高的牛人，他们早已在晨光中跑向那个你永远只能眺望的远方</p>
          </blockquote>
          
          <blockquote>
            <p>在你经历过风吹雨打之后，也许会伤痕累累，但是当雨后的第一缕阳光投射到你那苍白、憔悴的脸庞时，你应该欣喜若狂，并不是因为阳光的温暖，而是在苦了心志，劳了筋骨，饿了体肤之后，你毅然站立在前进的路上，做着坚韧上进的自己</p>
          </blockquote>
          
          <blockquote>
            <p>其实你现在在哪里，并不是那么重要。只要你有一颗永远向上的心，你终究会找到那个你自己的方向</p>
          </blockquote>
          
          <blockquote>
            <p>所以，<strong>请不要在最能吃苦的时候选择安逸</strong></p>
          </blockquote>
          
          <blockquote>
            <p>没有人的青春是在红地毯上走过，既然梦想成为那个别人无法企及的自我，就应该选择一条属于自己的道路，为了到达终点，付出别人无法企及的努力</p>
          </blockquote>

        {% elif page.type === 'links' %}
          <div class="links">
            {% if theme.links %}
            <ul>
              {% for name, link in theme.links %}
                <li>
                {% set linkInfo = link.split('||') %}
                  <a href="{{ linkInfo[0] }}" title="{{ name }}" target="_blank">
                    <img class="no-fancybox" src="{{ linkInfo[1] }}">
                    <h4>{{ name }}</h4>
                    <p>{{ linkInfo[2] }}</p>
                  </a>
                </li>
              {% endfor %}
            </ul>
          {% endif %}
          </div>
          {{ page.content }}
        {% else %}
          {{ page.content }}
        {% endif %}
      </div>
      {#####################}
      {### END PAGE BODY ###}
      {#####################}
    </div>
    {######################}
    {### END PAGE BLOCK ###}
    {######################}
  </div>

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}

{% block script_extra %}
  {% include '_scripts/pages/post-details.swig' %}
{% endblock %}
