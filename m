Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BD97B
	for <imx@lists.linux.dev>; Tue,  4 Oct 2022 11:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664882311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gnepkY0TgZKqop1C+S4YBSp9YXD3uP2dxXvg2KODGSM=;
	b=EGwsTaVyTagGMsaoZEeli9lMdU1nwI0XEND8uBLdr4FnmC9KX+Uf4HaIewdF3lALXMaBoR
	McVMzeHNPMGet/0oweAvYb2HQIbkwRkYk+pfMxXdYARFNrGJm2zxx099evlhUSDAidHEBk
	jJRztIkdJHPUH8YNJhJP+xj1WWcEc9s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-OwkZqF5rOimk-bU8EXKDxA-1; Tue, 04 Oct 2022 07:18:30 -0400
X-MC-Unique: OwkZqF5rOimk-bU8EXKDxA-1
Received: by mail-ed1-f70.google.com with SMTP id x5-20020a05640226c500b00451ec193793so10928191edd.16
        for <imx@lists.linux.dev>; Tue, 04 Oct 2022 04:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=gnepkY0TgZKqop1C+S4YBSp9YXD3uP2dxXvg2KODGSM=;
        b=iWayDStamYWQ2RzAPR/yoFfnUnbXPkpKCe756Z/sVIbnfG+JO5l2R/+XMbm9l+aI56
         z45kuxgQ1C2Vk8lQpCXtyUbLtm0DltNNj8wOhSVRTKhsxSgkgSOXdvExScn4hz2JMGLO
         T9Xgx2OsCSlS8TqTi/W//ExrDzc3t0nbO8xpmauWuJA+dI6PFumJQVLilqIUMZB5rXA/
         30Be3dlaF0l7JJYnZRlir4g5SdwnjNRYmVhDgC7lqhif0ArjMBKQdYez+FjOqvnIqpsR
         xQvQmSJyAOEvOUUpXhvGqhB5iaeILDEK8pWfIV9iXEYuLYCX2i4J1XwELb3WfKE9S4dL
         sF+Q==
X-Gm-Message-State: ACrzQf01PqkDhi70PMa2o6+sItHBj/De0EAaJKxJTfm6d3+Zn1cy5XBF
	DyQsIVhVYbxj4oRwmMM8XxwHq8OQFv7sIwfXOnr/xNnn5T0m0oxpCSSrwFIHrghMGhm+tXpxUDE
	huAuR5s4Sblfk
X-Received: by 2002:a05:6402:90a:b0:458:ca4d:a2f8 with SMTP id g10-20020a056402090a00b00458ca4da2f8mr12409295edz.230.1664882309711;
        Tue, 04 Oct 2022 04:18:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5wxjDzIjFVczqqYoXyO3JSiwl1e1NNSpIMVWjPSFP032LsEqgpeVHfPd879v/3Em5EYMMGTQ==
X-Received: by 2002:a05:6402:90a:b0:458:ca4d:a2f8 with SMTP id g10-20020a056402090a00b00458ca4da2f8mr12409263edz.230.1664882309499;
        Tue, 04 Oct 2022 04:18:29 -0700 (PDT)
Received: from [192.168.41.81] (83-90-141-187-cable.dk.customer.tdc.net. [83.90.141.187])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0073d7bef38e3sm6839369eja.45.2022.10.04.04.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 04:18:28 -0700 (PDT)
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <850048b2-ec8b-26db-6ea7-92ed30aab207@redhat.com>
Date: Tue, 4 Oct 2022 13:18:27 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Cc: brouer@redhat.com, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Wei Fang <wei.fang@nxp.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH v2 1/1] net: fec: using page pool to manage RX buffers
To: Jakub Kicinski <kuba@kernel.org>, Shenwei Wang <shenwei.wang@nxp.com>
References: <20220930204427.1299077-1-shenwei.wang@nxp.com>
 <20221003165157.2bbdae26@kernel.org>
In-Reply-To: <20221003165157.2bbdae26@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 04/10/2022 01.51, Jakub Kicinski wrote:
> On Fri, 30 Sep 2022 15:44:27 -0500 Shenwei Wang wrote:
>> This patch optimizes the RX buffer management by using the page
>> pool. The purpose for this change is to prepare for the following
>> XDP support. The current driver uses one frame per page for easy
>> management.
> 
> I believe this has been applied as:
> 
> commit 95698ff6177b ("net: fec: using page pool to manage RX buffers")
> 
> to net-next. Thanks!
> 

Sorry, that I was not quick enough to review and ACK this patch.
I just went over it quickly and the page_pool adding LGTM, so:

Acked-by: Jesper Dangaard Brouer <brouer@redhat.com>

