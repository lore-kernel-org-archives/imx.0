Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4177112DAF
	for <imx@lists.linux.dev>; Thu, 10 Nov 2022 11:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668081261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DBXYRpLp9moONU6VGCquLi5t9Eh718cfLlFyFi9l3CA=;
	b=fAbtH5bEpWweISKPfGk0FD6NungyyK+939ASZxNfUsDkZ1ifeTtC6OuqWCxk62W3A6upAm
	H0PwnJHVRdqHyTLHVDAx4JkdCIqSH8dpFoU+56879NI8qs1MznBH831gWE9N9IYfVVq2d6
	rMh7Xlsw5Z8Eq20Xrbzly069NOkRl0o=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-DJ_Nkr_OOZClJvrQ806PfA-1; Thu, 10 Nov 2022 06:54:17 -0500
X-MC-Unique: DJ_Nkr_OOZClJvrQ806PfA-1
Received: by mail-qt1-f197.google.com with SMTP id y19-20020a05622a121300b003a526e0ff9bso1150856qtx.15
        for <imx@lists.linux.dev>; Thu, 10 Nov 2022 03:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DBXYRpLp9moONU6VGCquLi5t9Eh718cfLlFyFi9l3CA=;
        b=2n3RgrlUqU6WRm28TWe/FWDtX+aJRx94aZDUoQldduq9k6v8sV3CTI2UB62SmK4i0H
         TGERAZs5fXOuU1IJVOsv5fMj0DOAqo59G22vXOfBAEQsd/WF0u20HbCs436YIatlR2w3
         1gfOsxnpy9c/0+YP1H0rbQtVuW068pEoeJeP7v+SYhbjjKbhf2r+8110aeClmFJi07T2
         35Jd5LMwnGkmt2EqKiWQQcmLNfJWoxYN3sDWM3LAet05JCX1bRIZhd+7NhbHG+Papxsd
         FhOaCqm59UvPEG9uckuCjm75W/gj+/YJE0l6abH3bPSyvLY/O7YrsQU1M7e7ekx7QAA4
         Yi4A==
X-Gm-Message-State: ACrzQf0y+xpSyb+u5KqXK2kAWDvWNuzIfDX3YVzSw0d7I1t+4KpeKyjI
	XqGzkq9G+vtg+gVcdbEm0e+ckLqYuX0rZxCxQRL+X8v8/MNqXM0j8LP2pQSq4LYjThn3lWIRl/p
	vJUYY/o259cwf
X-Received: by 2002:ac8:4b5c:0:b0:3a5:3819:4f6c with SMTP id e28-20020ac84b5c000000b003a538194f6cmr38476108qts.115.1668081257434;
        Thu, 10 Nov 2022 03:54:17 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5nK2/+RlTh1FXxmhK8+LIPkQeubcCUEzrXAdqnVRAT4J5njdAZps09YmsvbfRUfDGECJVtPQ==
X-Received: by 2002:ac8:4b5c:0:b0:3a5:3819:4f6c with SMTP id e28-20020ac84b5c000000b003a538194f6cmr38476094qts.115.1668081257203;
        Thu, 10 Nov 2022 03:54:17 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-120-203.dyn.eolo.it. [146.241.120.203])
        by smtp.gmail.com with ESMTPSA id o16-20020a05620a2a1000b006ce3f1af120sm13196566qkp.44.2022.11.10.03.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 03:54:16 -0800 (PST)
Message-ID: <4349bc93a5f2130a95305287141fde369245f921.camel@redhat.com>
Subject: Re: [PATCH v2 RESEND 1/1] net: fec: add xdp and page pool statistics
From: Paolo Abeni <pabeni@redhat.com>
To: Shenwei Wang <shenwei.wang@nxp.com>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>,  netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Date: Thu, 10 Nov 2022 12:54:13 +0100
In-Reply-To: <20221109023147.242904-1-shenwei.wang@nxp.com>
References: <20221109023147.242904-1-shenwei.wang@nxp.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hello,

On Tue, 2022-11-08 at 20:31 -0600, Shenwei Wang wrote:
> @@ -2685,9 +2738,16 @@ static void fec_enet_get_strings(struct net_device *netdev,
>  	int i;
>  	switch (stringset) {
>  	case ETH_SS_STATS:
> -		for (i = 0; i < ARRAY_SIZE(fec_stats); i++)
> -			memcpy(data + i * ETH_GSTRING_LEN,
> -				fec_stats[i].name, ETH_GSTRING_LEN);
> +		for (i = 0; i < ARRAY_SIZE(fec_stats); i++) {
> +			memcpy(data, fec_stats[i].name, ETH_GSTRING_LEN);
> +			data += ETH_GSTRING_LEN;
> +		}
> +		for (i = 0; i < ARRAY_SIZE(fec_xdp_stat_strs); i++) {
> +			memcpy(data, fec_xdp_stat_strs[i], ETH_GSTRING_LEN);
> +			data += ETH_GSTRING_LEN;

The above triggers a warning:

In function ‘fortify_memcpy_chk’,
    inlined from ‘fec_enet_get_strings’ at ../drivers/net/ethernet/freescale/fec_main.c:2788:4:
../include/linux/fortify-string.h:413:25: warning: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
  413 |                         __read_overflow2_field(q_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I think you can address it changing fec_xdp_stat_strs definition to:

static const char fec_xdp_stat_strs[XDP_STATS_TOTAL][ETH_GSTRING_LEN] = { // ...

Cheers,

Paolo

