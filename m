Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2529C65F
	for <imx@lists.linux.dev>; Thu,  6 Oct 2022 08:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665045473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vfSieDlJRiyczJdTgyk/f0r7hqD8jvSMcmnFxpCvvMQ=;
	b=ZMgi2bqRla7W35Lim0RbX+NkKdJ1lCEWPskaBngPTSucLe07U/OAqjkK0Lv/sqSJzl19Av
	Kzgx2IGDLu5F6IKdVy0zMb7IH8ivDRhSrWeqTgQwc0JtVRwdyy6NQDB2taTVSHAesG4zjz
	VfYzbXrZNUiCXuziPznB46P3MOp5cLQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-529-apPn2Y5qMsyJl83YDhvbYQ-1; Thu, 06 Oct 2022 04:37:52 -0400
X-MC-Unique: apPn2Y5qMsyJl83YDhvbYQ-1
Received: by mail-ed1-f72.google.com with SMTP id b16-20020a056402279000b0044f1102e6e2so1043440ede.20
        for <imx@lists.linux.dev>; Thu, 06 Oct 2022 01:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfSieDlJRiyczJdTgyk/f0r7hqD8jvSMcmnFxpCvvMQ=;
        b=1CzrG96fff9IlyIiCoobldNYdyvRFK6iBC25P6pDu/194qRVLol31OYjcU/LSBs7tV
         6qz9MOnb3v9vuxYskheUTWJfkdJjPbgCMhUmOTnH3ZOBVSoVPSvt6217BeqOfVfyAkKX
         6Jxdlje7Q3H01w4naPNPLa5b4X6zjd+5GvUmAJ7MVFHbSYZyVaT/MaHqN7uqeg84oxsn
         VLR5+m7Ez3WeXYSHR55FQ/dvSGcKfR6r0eFdGG+MdzbujKbbJH/0A59yoE16ldk5sCq4
         BIWVaktyoAV7+Xh9F1XMhx2K32Y+8+QqJRPpS63keck+OpcCczXgdvaNeLqruB1VuTWO
         85oA==
X-Gm-Message-State: ACrzQf3uQMJkQbFYujBV38G3oobWyC8Bu2Ryb10DiHFGHFA94pJAs2+A
	o1KJ01xlczRMz2d41nbOmd6+lPgtd6tu8PbqZsJEdzKEXWcO6H7uVChG/4cJ/C1Dm2oHzjfKoGr
	YEH2PL1sPeszZ
X-Received: by 2002:a05:6402:40d3:b0:451:5249:d516 with SMTP id z19-20020a05640240d300b004515249d516mr3578086edb.154.1665045470887;
        Thu, 06 Oct 2022 01:37:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4HGQ/LsLCohR5LxQqOGnTRG052pFe12znYF1oIcEHFjMKzcaT3JBOWNqG2aJbDYfE5q2CdoQ==
X-Received: by 2002:a05:6402:40d3:b0:451:5249:d516 with SMTP id z19-20020a05640240d300b004515249d516mr3578071edb.154.1665045470624;
        Thu, 06 Oct 2022 01:37:50 -0700 (PDT)
Received: from [192.168.41.81] (83-90-141-187-cable.dk.customer.tdc.net. [83.90.141.187])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906308100b0073ddb2eff27sm9908989ejv.167.2022.10.06.01.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 01:37:50 -0700 (PDT)
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <eb8d097b-e53b-ed09-f598-71cac24edb7c@redhat.com>
Date: Thu, 6 Oct 2022 10:37:48 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Cc: brouer@redhat.com, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Magnus Karlsson <magnus.karlsson@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [EXT] Re: [PATCH 1/1] net: fec: add initial XDP support
To: Shenwei Wang <shenwei.wang@nxp.com>,
 Jesper Dangaard Brouer <jbrouer@redhat.com>, Andrew Lunn <andrew@lunn.ch>
References: <20220928152509.141490-1-shenwei.wang@nxp.com>
 <YzT2An2J5afN1w3L@lunn.ch>
 <PAXPR04MB9185141B58499FD00C43BB6889579@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <YzWcI+U1WYJuZIdk@lunn.ch>
 <PAXPR04MB918545B92E493CB57CDE612B89579@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <ae658987-8763-c6de-7198-1a418e4728b4@redhat.com>
 <PAXPR04MB918584422BE4ECAF79C0295A89579@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afb652db-05fc-d3d6-6774-bfd9830414d9@redhat.com>
 <PAXPR04MB9185743919EC6DDA54FAC3B7895B9@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <4f7cf74d-95ca-f93f-7328-e0386348a06e@redhat.com>
 <AS8PR04MB9176281109667B36CB694763895A9@AS8PR04MB9176.eurprd04.prod.outlook.com>
 <AS8PR04MB917670AAD2045CEBC122FEE1895A9@AS8PR04MB9176.eurprd04.prod.outlook.com>
 <PAXPR04MB918565DF416D879FF9232A6C895D9@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB918565DF416D879FF9232A6C895D9@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/10/2022 14.40, Shenwei Wang wrote:
> Hi Jesper,
> 
> Here is the summary of "xdp_rxq_info" testing.
> 
>                skb_mark_for_recycle           page_pool_release_page
> 
>               Native        SKB-Mode           Native          SKB-Mode
> XDP_DROP     460K           220K              460K             102K
> XDP_PASS     80K            113K              60K              62K
> 

It is very pleasing to see the *huge* performance benefit that page_pool
provide when recycling pages for SKBs (via skb_mark_for_recycle).
I did expect a performance boost, but not around a x2 performance boost.

I guess this platform have a larger overhead for DMA-mapping and
page-allocation.

IMHO it would be valuable to include this result as part of the patch
description when you post the XDP patch again.

Only strange result is XDP_PASS 'Native' is slower that 'SKB-mode'. I
cannot explain why, as XDP_PASS essentially does nothing and just follow
normal driver code to netstack.

Thanks a lot for doing these tests.
--Jesper

> The following are the testing log.
> 
> Thanks,
> Shenwei
> 
> ### skb_mark_for_recycle solution ###
> 
> ./xdp_rxq_info --dev eth0 --act XDP_DROP --read
> 
> Running XDP on dev:eth0 (ifindex:2) action:XDP_DROP options:read
> XDP stats       CPU     pps         issue-pps
> XDP-RX CPU      0       466,553     0
> XDP-RX CPU      total   466,553
> 
> ./xdp_rxq_info -S --dev eth0 --act XDP_DROP --read
> 
> Running XDP on dev:eth0 (ifindex:2) action:XDP_DROP options:read
> XDP stats       CPU     pps         issue-pps
> XDP-RX CPU      0       226,272     0
> XDP-RX CPU      total   226,272
> 
> ./xdp_rxq_info --dev eth0 --act XDP_PASS --read
> 
> Running XDP on dev:eth0 (ifindex:2) action:XDP_PASS options:read
> XDP stats       CPU     pps         issue-pps
> XDP-RX CPU      0       80,518      0
> XDP-RX CPU      total   80,518
> 
> ./xdp_rxq_info -S --dev eth0 --act XDP_PASS --read
> 
> Running XDP on dev:eth0 (ifindex:2) action:XDP_PASS options:read
> XDP stats       CPU     pps         issue-pps
> XDP-RX CPU      0       113,681     0
> XDP-RX CPU      total   113,681
> 
> 
> ### page_pool_release_page solution ###
> 
> ./xdp_rxq_info --dev eth0 --act XDP_DROP --read
> 
> Running XDP on dev:eth0 (ifindex:2) action:XDP_DROP options:read
> XDP stats       CPU     pps         issue-pps
> XDP-RX CPU      0       463,145     0
> XDP-RX CPU      total   463,145
> 
> ./xdp_rxq_info -S --dev eth0 --act XDP_DROP --read
> 
> Running XDP on dev:eth0 (ifindex:2) action:XDP_DROP options:read
> XDP stats       CPU     pps         issue-pps
> XDP-RX CPU      0       104,443     0
> XDP-RX CPU      total   104,443
> 
> ./xdp_rxq_info --dev eth0 --act XDP_PASS --read
> 
> Running XDP on dev:eth0 (ifindex:2) action:XDP_PASS options:read
> XDP stats       CPU     pps         issue-pps
> XDP-RX CPU      0       60,539      0
> XDP-RX CPU      total   60,539
> 
> ./xdp_rxq_info -S --dev eth0 --act XDP_PASS --read
> 
> Running XDP on dev:eth0 (ifindex:2) action:XDP_PASS options:read
> XDP stats       CPU     pps         issue-pps
> XDP-RX CPU      0       62,566      0
> XDP-RX CPU      total   62,566
> 
>> -----Original Message-----
>> From: Shenwei Wang
>> Sent: Tuesday, October 4, 2022 8:34 AM
>> To: Jesper Dangaard Brouer <jbrouer@redhat.com>; Andrew Lunn
>> <andrew@lunn.ch>
>> Cc: brouer@redhat.com; David S. Miller <davem@davemloft.net>; Eric Dumazet
>> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
>> <pabeni@redhat.com>; Alexei Starovoitov <ast@kernel.org>; Daniel Borkmann
>> <daniel@iogearbox.net>; Jesper Dangaard Brouer <hawk@kernel.org>; John
>> Fastabend <john.fastabend@gmail.com>; netdev@vger.kernel.org; linux-
>> kernel@vger.kernel.org; imx@lists.linux.dev; Magnus Karlsson
>> <magnus.karlsson@gmail.com>; Björn Töpel <bjorn@kernel.org>; Ilias
>> Apalodimas <ilias.apalodimas@linaro.org>
>> Subject: RE: [EXT] Re: [PATCH 1/1] net: fec: add initial XDP support
>>
>>
>>
>>> -----Original Message-----
>>> From: Shenwei Wang
>>> Sent: Tuesday, October 4, 2022 8:13 AM
>>> To: Jesper Dangaard Brouer <jbrouer@redhat.com>; Andrew Lunn
>> ...
>>> I haven't tested xdp_rxq_info yet, and will have a try sometime later today.
>>> However, for the XDP_DROP test, I did try xdp2 test case, and the
>>> testing result looks reasonable. The performance of Native mode is
>>> much higher than skb- mode.
>>>
>>> # xdp2 eth0
>>>   proto 0:     475362 pkt/s
>>>
>>> # xdp2 -S eth0             (page_pool_release_page solution)
>>>   proto 17:     71999 pkt/s
>>>
>>> # xdp2 -S eth0             (skb_mark_for_recycle solution)
>>>   proto 17:     72228 pkt/s
>>>
>>
>> Correction for xdp2 -S eth0	(skb_mark_for_recycle solution)
>> proto 0:          0 pkt/s
>> proto 17:     122473 pkt/s
>>
>> Thanks,
>> Shenwei
> 

