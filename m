Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF62A5381
	for <imx@lists.linux.dev>; Thu, 29 Sep 2022 15:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664465330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BWdtBthhznDnqjUu3vrXZ37rQDG7v0SPEu95AzFm5Vw=;
	b=hldz+X82rfqY5D7eLh8Jeok1WINR+axQR2MB+T15WYhs8CoHxm+C1Zc3mSin4zeeRNmL7o
	RLunOqDSzXDBG270B4LOJOVYOHOIAs901FtMMitxlGZopN5orCxHxnpSISrz8XtO9VnIOq
	6hOloVe/YrIsDps7Qg9KmMrzg3Oc3XQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-478-6LEA2ui5N5KrtF5HhfyuUA-1; Thu, 29 Sep 2022 11:28:47 -0400
X-MC-Unique: 6LEA2ui5N5KrtF5HhfyuUA-1
Received: by mail-ej1-f72.google.com with SMTP id jg16-20020a170907971000b00782d87ab6e5so893967ejc.0
        for <imx@lists.linux.dev>; Thu, 29 Sep 2022 08:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:cc:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BWdtBthhznDnqjUu3vrXZ37rQDG7v0SPEu95AzFm5Vw=;
        b=250dWi0WqI0QPBH6aAfO1UcszM7lCbbUK5B7sIzA9QNEznVrkU9WeQWZxGmkyoLQ8j
         rlMZklB2EnCQBXfnn5PSKj5KRy+rJ7tDPFICShdLDnL4wgqpfdDY/eQHDIGlzVYP3T/w
         +T06sOA1WfKYWDqrAMHMbA2ju2xyHbT4hUM7xgYZ6FVPmvWHoSSr9vKFGRkA3Yc1plYT
         a2CkhogNcZugQHIrXPNvBuMsd0+tHDRS4wo67/dT8Bgin+plxSymwT7r8ok4FAxrZvoE
         QfGSMi1Fk3YRxu548dUP0quy5aeuM3dvI6j5OgmeBtDJCWI1d/5HOTBTZm3K3NGXvPqx
         6caw==
X-Gm-Message-State: ACrzQf1KNbLC9AljONQml++Dmyoflfco3jbV4vz7/2IBs/m+ejuQkq9K
	ajx0ZVd4RTF0LXhzA17xxpNhPsfx2aujGKhw/UrKpEXi2T5QKLof7WToXTRpnrBXmuV+EjAiON4
	oaPE+1Hd/s0XN
X-Received: by 2002:a17:906:974f:b0:780:4a3c:d179 with SMTP id o15-20020a170906974f00b007804a3cd179mr3306983ejy.289.1664465326152;
        Thu, 29 Sep 2022 08:28:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM74/4NIsoCqtX6lSUOGXbmSxQA8hkyoxpaGVA5PqFDA+efJZxNcgUXt81Okw0Aqu121kZMQmQ==
X-Received: by 2002:a17:906:974f:b0:780:4a3c:d179 with SMTP id o15-20020a170906974f00b007804a3cd179mr3306957ejy.289.1664465325887;
        Thu, 29 Sep 2022 08:28:45 -0700 (PDT)
Received: from [192.168.41.81] (83-90-141-187-cable.dk.customer.tdc.net. [83.90.141.187])
        by smtp.gmail.com with ESMTPSA id d4-20020a1709061f4400b00783c545544fsm4150990ejk.215.2022.09.29.08.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 08:28:45 -0700 (PDT)
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <ae658987-8763-c6de-7198-1a418e4728b4@redhat.com>
Date: Thu, 29 Sep 2022 17:28:43 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Cc: brouer@redhat.com, Joakim Zhang <qiangqing.zhang@nxp.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [EXT] Re: [PATCH 1/1] net: fec: add initial XDP support
To: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>
References: <20220928152509.141490-1-shenwei.wang@nxp.com>
 <YzT2An2J5afN1w3L@lunn.ch>
 <PAXPR04MB9185141B58499FD00C43BB6889579@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <YzWcI+U1WYJuZIdk@lunn.ch>
 <PAXPR04MB918545B92E493CB57CDE612B89579@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB918545B92E493CB57CDE612B89579@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/09/2022 15.26, Shenwei Wang wrote:
> 
>> From: Andrew Lunn <andrew@lunn.ch>
>> Sent: Thursday, September 29, 2022 8:23 AM
[...]
>>
>>> I actually did some compare testing regarding the page pool for normal
>>> traffic.  So far I don't see significant improvement in the current
>>> implementation. The performance for large packets improves a little,
>>> and the performance for small packets get a little worse.
>>
>> What hardware was this for? imx51? imx6? imx7 Vybrid? These all use the FEC.
> 
> I tested on imx8qxp platform. It is ARM64.

On mvneta driver/platform we saw huge speedup replacing:

   page_pool_release_page(rxq->page_pool, page);
with
   skb_mark_for_recycle(skb);

As I mentioned: Today page_pool have SKB recycle support (you might have 
looked at drivers that didn't utilize this yet), thus you don't need to 
release the page (page_pool_release_page) here.  Instead you could 
simply mark the SKB for recycling, unless driver does some page refcnt 
tricks I didn't notice.

On the mvneta driver/platform the DMA unmap (in page_pool_release_page) 
was very expensive. This imx8qxp platform might have faster DMA unmap in 
case is it cache-coherent.

I would be very interested in knowing if skb_mark_for_recycle() helps on 
this platform, for normal network stack performance.

>> By small packets, do you mean those under the copybreak limit?
>>
>> Please provide some benchmark numbers with your next patchset.
> 
> Yes, the packet size is 64 bytes and it is under the copybreak limit.
> As the impact is not significant, I would prefer to remove the
> copybreak  logic.

+1 to removing this logic if possible, due to maintenance cost.

--Jesper

