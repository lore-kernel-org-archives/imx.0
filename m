Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FADB53B5
	for <imx@lists.linux.dev>; Thu, 29 Sep 2022 18:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664477725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ii/zdDDzioDeAg4ijCoWLsXuT0PoJynFMmsjY+6iNyY=;
	b=YrAJnxB3jIix8CqDFR8c+GvbdMQV+CnFE9aQ+lCU5Cs0hMFRONoZOfUD1/Drow7bDaS61W
	qgAjYD5zwVhDHWRFJ7q2JH01aou+a3i3Elp5PV8iRPxtS+g8a6AwMbXA3UshTNtbeMS99T
	h8RvX2WserxwBf2qKkiZRK5y0J8iy0w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-470-VB9mSPmZP7eR5-DDbDXApA-1; Thu, 29 Sep 2022 14:55:24 -0400
X-MC-Unique: VB9mSPmZP7eR5-DDbDXApA-1
Received: by mail-ed1-f70.google.com with SMTP id x5-20020a05640226c500b00451ec193793so1891623edd.16
        for <imx@lists.linux.dev>; Thu, 29 Sep 2022 11:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=Ii/zdDDzioDeAg4ijCoWLsXuT0PoJynFMmsjY+6iNyY=;
        b=RtMSYc+EFdjqWfy61dOCijeCYnTiGclZ2l0fCdThdOxNfGv4uS7gFn8t25GpFoq/+M
         KStWWdRFYNCgNPqxmt99McrHXLyO2UlU/p97jNT1c6R9RJXsBnlScwA31FDOJQ4iIvM+
         FvKbv7N0lRmPCsHE9CJwl9oMp9W3HuNv/7jG6528BpNd/XDsacMrmYhzhSmY/oEVknt4
         gCuvV+Knb7zj/RIKiKT+Moe/T7LRVMwOkLXZ6MwF1wBCcydYJbcBYp4ZS7yjeBvmhvwq
         l8yAg4LObueAmQc21rSiOll9Ks0f2GG0s+kZQ2HleBEdr+pb3gLjxgUXzbAuD8UZZHOt
         t/cA==
X-Gm-Message-State: ACrzQf3ZxVjL84Bv17x1u1WKnuWAGlRvp3VK3XOUnPNkvwd5QRLX+tof
	CE61rv8tAR30QkSmmkEOqF3ktM5PJkSoN9i1jiU34nrMfVrqIkl8rXUOC1hrkBzMxEDNx0TeAPF
	VRs4ICwLz32Xm
X-Received: by 2002:a17:906:eec1:b0:782:6384:76be with SMTP id wu1-20020a170906eec100b00782638476bemr3829806ejb.756.1664477722951;
        Thu, 29 Sep 2022 11:55:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM42IrmOoNBkxw7IFK/Fcf3fs7srHeyKhwzHkAPoxCYkxOO/VTiZbG6+F2H6PCnMvcmycfKlHA==
X-Received: by 2002:a17:906:eec1:b0:782:6384:76be with SMTP id wu1-20020a170906eec100b00782638476bemr3829779ejb.756.1664477722669;
        Thu, 29 Sep 2022 11:55:22 -0700 (PDT)
Received: from [192.168.41.81] (83-90-141-187-cable.dk.customer.tdc.net. [83.90.141.187])
        by smtp.gmail.com with ESMTPSA id m17-20020a170906581100b0073a644ef803sm4383184ejq.101.2022.09.29.11.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 11:55:22 -0700 (PDT)
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <afb652db-05fc-d3d6-6774-bfd9830414d9@redhat.com>
Date: Thu, 29 Sep 2022 20:55:20 +0200
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
To: Shenwei Wang <shenwei.wang@nxp.com>,
 Jesper Dangaard Brouer <jbrouer@redhat.com>, Andrew Lunn <andrew@lunn.ch>
References: <20220928152509.141490-1-shenwei.wang@nxp.com>
 <YzT2An2J5afN1w3L@lunn.ch>
 <PAXPR04MB9185141B58499FD00C43BB6889579@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <YzWcI+U1WYJuZIdk@lunn.ch>
 <PAXPR04MB918545B92E493CB57CDE612B89579@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <ae658987-8763-c6de-7198-1a418e4728b4@redhat.com>
 <PAXPR04MB918584422BE4ECAF79C0295A89579@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB918584422BE4ECAF79C0295A89579@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/09/2022 17.52, Shenwei Wang wrote:
> 
>> From: Jesper Dangaard Brouer <jbrouer@redhat.com>
>>
>> On 29/09/2022 15.26, Shenwei Wang wrote:
>>>
>>>> From: Andrew Lunn <andrew@lunn.ch>
>>>> Sent: Thursday, September 29, 2022 8:23 AM
>> [...]
>>>>
>>>>> I actually did some compare testing regarding the page pool for
>>>>> normal traffic.  So far I don't see significant improvement in the
>>>>> current implementation. The performance for large packets improves a
>>>>> little, and the performance for small packets get a little worse.
>>>>
>>>> What hardware was this for? imx51? imx6? imx7 Vybrid? These all use the FEC.
>>>
>>> I tested on imx8qxp platform. It is ARM64.
>>
>> On mvneta driver/platform we saw huge speedup replacing:
>>
>>     page_pool_release_page(rxq->page_pool, page); with
>>     skb_mark_for_recycle(skb);
>>
>> As I mentioned: Today page_pool have SKB recycle support (you might have
>> looked at drivers that didn't utilize this yet), thus you don't need to release the
>> page (page_pool_release_page) here.  Instead you could simply mark the SKB
>> for recycling, unless driver does some page refcnt tricks I didn't notice.
>>
>> On the mvneta driver/platform the DMA unmap (in page_pool_release_page)
>> was very expensive. This imx8qxp platform might have faster DMA unmap in
>> case is it cache-coherent.
>>
>> I would be very interested in knowing if skb_mark_for_recycle() helps on this
>> platform, for normal network stack performance.
>>
> 
> Did a quick compare testing for the following 3 scenarios:

Thanks for doing this! :-)

> 1. original implementation
> 
> shenwei@5810:~$ iperf -c 10.81.16.245 -w 2m -i 1
> ------------------------------------------------------------
> Client connecting to 10.81.16.245, TCP port 5001
> TCP window size:  416 KByte (WARNING: requested 1.91 MByte)
> ------------------------------------------------------------
> [  1] local 10.81.17.20 port 49154 connected with 10.81.16.245 port 5001
> [ ID] Interval       Transfer     Bandwidth
> [  1] 0.0000-1.0000 sec   104 MBytes   868 Mbits/sec
> [  1] 1.0000-2.0000 sec   105 MBytes   878 Mbits/sec
> [  1] 2.0000-3.0000 sec   105 MBytes   881 Mbits/sec
> [  1] 3.0000-4.0000 sec   105 MBytes   879 Mbits/sec
> [  1] 4.0000-5.0000 sec   105 MBytes   878 Mbits/sec
> [  1] 5.0000-6.0000 sec   105 MBytes   878 Mbits/sec
> [  1] 6.0000-7.0000 sec   104 MBytes   875 Mbits/sec
> [  1] 7.0000-8.0000 sec   104 MBytes   875 Mbits/sec
> [  1] 8.0000-9.0000 sec   104 MBytes   873 Mbits/sec
> [  1] 9.0000-10.0000 sec   104 MBytes   875 Mbits/sec
> [  1] 0.0000-10.0073 sec  1.02 GBytes   875 Mbits/sec
> 
> 2. Page pool with page_pool_release_page
> 
> shenwei@5810:~$ iperf -c 10.81.16.245 -w 2m -i 1
> ------------------------------------------------------------
> Client connecting to 10.81.16.245, TCP port 5001
> TCP window size:  416 KByte (WARNING: requested 1.91 MByte)
> ------------------------------------------------------------
> [  1] local 10.81.17.20 port 35924 connected with 10.81.16.245 port 5001
> [ ID] Interval       Transfer     Bandwidth
> [  1] 0.0000-1.0000 sec   101 MBytes   849 Mbits/sec
> [  1] 1.0000-2.0000 sec   102 MBytes   860 Mbits/sec
> [  1] 2.0000-3.0000 sec   102 MBytes   860 Mbits/sec
> [  1] 3.0000-4.0000 sec   102 MBytes   859 Mbits/sec
> [  1] 4.0000-5.0000 sec   103 MBytes   863 Mbits/sec
> [  1] 5.0000-6.0000 sec   103 MBytes   864 Mbits/sec
> [  1] 6.0000-7.0000 sec   103 MBytes   863 Mbits/sec
> [  1] 7.0000-8.0000 sec   103 MBytes   865 Mbits/sec
> [  1] 8.0000-9.0000 sec   103 MBytes   862 Mbits/sec
> [  1] 9.0000-10.0000 sec   102 MBytes   856 Mbits/sec
> [  1] 0.0000-10.0246 sec  1.00 GBytes   858 Mbits/sec
> 
> 
> 3. page pool with skb_mark_for_recycle
> 
> shenwei@5810:~$ iperf -c 10.81.16.245 -w 2m -i 1
> ------------------------------------------------------------
> Client connecting to 10.81.16.245, TCP port 5001
> TCP window size:  416 KByte (WARNING: requested 1.91 MByte)
> ------------------------------------------------------------
> [  1] local 10.81.17.20 port 42724 connected with 10.81.16.245 port 5001
> [ ID] Interval       Transfer     Bandwidth
> [  1] 0.0000-1.0000 sec   111 MBytes   931 Mbits/sec
> [  1] 1.0000-2.0000 sec   112 MBytes   935 Mbits/sec
> [  1] 2.0000-3.0000 sec   111 MBytes   934 Mbits/sec
> [  1] 3.0000-4.0000 sec   111 MBytes   934 Mbits/sec
> [  1] 4.0000-5.0000 sec   111 MBytes   934 Mbits/sec
> [  1] 5.0000-6.0000 sec   112 MBytes   935 Mbits/sec
> [  1] 6.0000-7.0000 sec   111 MBytes   934 Mbits/sec
> [  1] 7.0000-8.0000 sec   111 MBytes   933 Mbits/sec
> [  1] 8.0000-9.0000 sec   112 MBytes   935 Mbits/sec
> [  1] 9.0000-10.0000 sec   111 MBytes   933 Mbits/sec
> [  1] 0.0000-10.0069 sec  1.09 GBytes   934 Mbits/sec

This is a very significant performance improvement (page pool with
skb_mark_for_recycle).  This is very close to the max goodput for a
1Gbit/s link.


> For small packet size (64 bytes), all three cases have almost the same result:
> 

To me this indicate, that the DMA map/unmap operations on this platform
are indeed more expensive on larger packets.  Given this is what
page_pool does, keeping the DMA mapping intact when recycling.

Driver still need DMA-sync, although I notice you set page_pool feature
flag PP_FLAG_DMA_SYNC_DEV, this is good as page_pool will try to reduce
sync size where possible. E.g. in this SKB case will reduce the DMA-sync
to the max_len=FEC_ENET_RX_FRSIZE which should also help on performance.


> shenwei@5810:~$ iperf -c 10.81.16.245 -w 2m -i 1 -l 64
> ------------------------------------------------------------
> Client connecting to 10.81.16.245, TCP port 5001
> TCP window size:  416 KByte (WARNING: requested 1.91 MByte)
> ------------------------------------------------------------
> [  1] local 10.81.17.20 port 58204 connected with 10.81.16.245 port 5001
> [ ID] Interval       Transfer     Bandwidth
> [  1] 0.0000-1.0000 sec  36.9 MBytes   309 Mbits/sec
> [  1] 1.0000-2.0000 sec  36.6 MBytes   307 Mbits/sec
> [  1] 2.0000-3.0000 sec  36.6 MBytes   307 Mbits/sec
> [  1] 3.0000-4.0000 sec  36.5 MBytes   307 Mbits/sec
> [  1] 4.0000-5.0000 sec  37.1 MBytes   311 Mbits/sec
> [  1] 5.0000-6.0000 sec  37.2 MBytes   312 Mbits/sec
> [  1] 6.0000-7.0000 sec  37.1 MBytes   311 Mbits/sec
> [  1] 7.0000-8.0000 sec  37.1 MBytes   311 Mbits/sec
> [  1] 8.0000-9.0000 sec  37.1 MBytes   312 Mbits/sec
> [  1] 9.0000-10.0000 sec  37.2 MBytes   312 Mbits/sec
> [  1] 0.0000-10.0097 sec   369 MBytes   310 Mbits/sec
> 
> Regards,
> Shenwei
> 
> 
>>>> By small packets, do you mean those under the copybreak limit?
>>>>
>>>> Please provide some benchmark numbers with your next patchset.
>>>
>>> Yes, the packet size is 64 bytes and it is under the copybreak limit.
>>> As the impact is not significant, I would prefer to remove the
>>> copybreak  logic.
>>
>> +1 to removing this logic if possible, due to maintenance cost.
>>
>> --Jesper
> 

