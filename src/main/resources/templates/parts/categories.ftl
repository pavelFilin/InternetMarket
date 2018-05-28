<#macro categories cates>
        <div class="col-md-3 bg-dark text-light">
            <div class="container-fluid" id="catalog" style="padding: 0">
                <div><h3 style="text-align: center">Категории товаров</h3></div>
                <#list cates as categoryNode>
                    <div>
                        <nav>
                            <button class="list-group-item" style="padding: 0px; width: 100%" type="button"
                                    data-toggle="collapse"
                                    data-target="#targetCategory1" aria-controls="navbarToggleExternalContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="list-group-item list-group-item-dark">${categoryNode}</span>
                            </button>
                        </nav>
                        <div class="collapse" id="targetCategory1">
                            <ul class="list-group">
                               <#list 0..categoryNode.getNode.size as x>
                                   <li class="list-group-item"><a href="">${categoryNode.get(x).getNode.getTitle}</a></li>
                               </#list>
                                <li class="list-group-item"><a href="">Спиннинговые</a></li>
                            </ul>
                        </div>
                    </div>
                </#list>
                <div>
                    <nav>
                        <button class="list-group-item" style="padding: 0px; width: 100%" type="button"
                                data-toggle="collapse"
                                data-target="#targetCategory1" aria-controls="navbarToggleExternalContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="list-group-item list-group-item-dark">Удилища, подставки, чехлы для удилищ</span>
                        </button>
                    </nav>
                    <div class="collapse" id="targetCategory1">
                        <ul class="list-group">
                            <li class="list-group-item"><a href="">Спиннинговые</a></li>
                            <li class="list-group-item"><a href="">Фидерные</a></li>
                            <li class="list-group-item"><a href="">Подставки под удилища</a></li>
                            <li class="list-group-item"><a href="">Чехлы для удилищ</a></li>
                        </ul>
                    </div>
                </div>
                <div>
                    <nav>
                        <button class="list-group-item" style="padding: 0px; width: 100%" type="button"
                                data-toggle="collapse"
                                data-target="#targetCategory2" aria-controls="navbarToggleExternalContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="list-group-item list-group-item-dark">Катушки, лески, шнуры</span>
                        </button>
                    </nav>
                    <div class="collapse" id="targetCategory2">
                        <ul class="list-group">
                            <li class="list-group-item"><a href="">Катушки инерционные</a></li>
                            <li class="list-group-item"><a href="">Катушки безинерционные</a></li>
                            <li class="list-group-item"><a href="">Лески</a></li>
                            <li class="list-group-item"><a href="">Шнуры</a></li>
                        </ul>
                    </div>
                </div>
                <div>
                    <nav>
                        <button class="list-group-item" style="padding: 0px; width: 100%" type="button"
                                data-toggle="collapse"
                                data-target="#targetCategory3" aria-controls="navbarToggleExternalContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="list-group-item list-group-item-dark">Крючки, грузила, джиг-головки</span>
                        </button>
                    </nav>
                    <div class="collapse" id="targetCategory3">
                        <ul class="list-group">
                            <li class="list-group-item"><a href="">Крючки одинарные</a></li>
                            <li class="list-group-item"><a href="">Крючки двойные</a></li>
                            <li class="list-group-item"><a href="">Крючки тройные</a></li>
                            <li class="list-group-item"><a href="">Грузила</a></li>
                            <li class="list-group-item"><a href="">Джиг-головки</a></li>
                        </ul>
                    </div>
                </div>
                <div>
                    <nav>
                        <button class="list-group-item" style="padding: 0px ; width: 100%" type="button"
                                data-toggle="collapse"
                                data-target="#targetCategory4" aria-controls="navbarToggleExternalContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="list-group-item list-group-item-dark">Приманки</span>
                        </button>
                    </nav>
                    <div class="collapse" id="targetCategory4">
                        <ul class="list-group">
                            <li class="list-group-item"><a href="">Блёсны</a></li>
                            <li class="list-group-item"><a href="">Воблёры</a></li>
                            <li class="list-group-item"><a href="">Силиконовые и поролоновые</a></li>
                        </ul>
                    </div>
                </div>
                <div>
                    <nav>
                        <button class="list-group-item" style="padding: 0px; width: 100%" type="button"
                                data-toggle="collapse"
                                data-target="#targetCategory5" aria-controls="navbarToggleExternalContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="list-group-item list-group-item-dark">Садки, подсаки, раколовки</span>
                        </button>
                    </nav>
                    <div class="collapse" id="targetCategory5">
                        <ul class="list-group">
                            <li class="list-group-item"><a href="">Палатки</a></li>
                            <li class="list-group-item"><a href="">Розжиг</a></li>
                            <li class="list-group-item"><a href="">Навигация</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

</#macro>