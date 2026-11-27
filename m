Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777507;
	b=MZKplUxoEh+tfGtr125OMFUGkxbHEAdloVi4Ew3nBYZhffr2xxmhDc/7d6qEqCOJUVgP
	 LTSoMzGFHEQQX+w63qqGDxhyxSq4lJHuWSOhX3bERAOb1E/Ly02isaLJVk12i3uCTD6JK
	 +s6NqR5Vqo+wBuAJV5vw1LicS+8ygx7X39n3ek6tGxbXSSRqfBReI7dTbHlnazelVBknY
	 cMxJS6ze3jwLvWmB3tAVIvgbv/Fgy+nRlxHww2zOCiA4zEh0z5O3JDj0VMoBWCseTeqsA
	 aqkW/HF9wGGN+cHhXU3FNC4deMSyujU+zJDPtLGFPj8DZUt3rDZ561kn9hZ5zHgJ6pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777507;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:From:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=qcpX6YwnHTFKfGu87lTd7oqauZWlHU08Aks6/ht/Glk=;
	b=LXVam0VKK93JQC/657HEMVjTqpdxvzoFZ+kBuU1xMNg/Gik20sG1T6AhCpjtueNbRtYT
	 Uti10KT6+n6WtQRfHNO/j5jN5cfn4hU5tbJIGm5ZQT5O2bp31BZjQzZvEccwF7a6tkyEA
	 ZSPDaQcIWKeQWb5MtNknc4QZ/F5E8yiwLmmi+JGSaVpbiZSu19K4j0p/n7yhjFdvj/jeQ
	 0cIZFi1zC16UZXrnV7/xTNhyWuh1EWjvHvtWzGHuQxFjaNXj4AWeKBdTH+kngfYQcCxm1
	 DWUsbV4pzHKyojTVD07S+XMiFPqLF2JiUuqVbuXcmzjpifWe5bfNnN2eHy2YlXbyfrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AKtCNtku;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1C9606A331
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 11:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C1C9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AKtCNtku
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795777506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qcpX6YwnHTFKfGu87lTd7oqauZWlHU08Aks6/ht/Glk=;
	b=AKtCNtkuNr3fYvG5jfs7ftgRV6Cj5Malbg5qz0Lq+GDATxF3bLKSzrn0syibBcgyUR8CA/
	BdacNtCmorOaLySarQBw4otJgwutPDUr5y130HITCMo6JBJnXcc2EeTh72SnighgtwrXKK
	2jRvwH6dSlNCOkytCFfeJtiLls4dbmM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-GEgfftK2Ok62eStniE_ojg-1; Fri, 27 Nov 2026 11:05:02 +0000
X-MC-Unique: GEgfftK2Ok62eStniE_ojg-1
X-Mimecast-MFC-AGG-ID: GEgfftK2Ok62eStniE_ojg_1795777501
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a82fb7e71eso4497328f8f.0
        for <imx@lists.linux.dev>; Fri, 27 Nov 2026 03:05:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777501; x=1796382301;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcpX6YwnHTFKfGu87lTd7oqauZWlHU08Aks6/ht/Glk=;
        b=RjkqflDTQ/rtRXEkuXsi8m6cuX+w4aQJ7SUBXtRh3a4XFF1FXlj6x2m/MSPveESflp
         7XMKEaMDuDDC55ABHkHxxpX8imXnagNggajb8UmXG0DBbzi3LJusWz0vAOEJBhRUrRvU
         OijMtKUU/RLIWeS28rPhWf9RcCvsKzrPR/jBjZvfH17eHV32UimMmyHxCuNmxJ4RvlNp
         sxtDT+H1x7PzCW+ZW0AneowelcMr0o6FjNFtECK60xs/rQZEx415KivVoqF8Xp3TSJof
         4pHo5qa31VMes6VmQoKnTsBxbiGJ3O6AFgs46nc3QcGNP7M3R0OeNYQ+Y9OCL1D/XtVs
         CUIw==
X-Forwarded-Encrypted: i=1; AL+hErFsbazxSrULAgTCOACWKBFFagr1rbJwYL8CN63ToQ4lnVJVkJD+7elvgZMvp8tXgFoVe78=@lists.linux.dev
X-Gm-Message-State: APuU4Z9TrzXqdjpbcR3CtK66oaInsgXousmSkFWzoHsdaa0bZJHeqmjv
	5XxmpWJwPTtDfW99HM6wlvG+Bg8kMV3bfqsTy9XHy+Fej2acEYf/n2Ts/5xZpDdAs5dvjpfAHgG
	zW/KUe0oREWprX+oLVwsz5IRjgpDWZrCdCQX663Nl1WNAXGvSe2XqUw==
X-Gm-Gg: AZFdTZcJ0Gnb9nSsTLh9u3l+lB6KDleUtkjPQfhXrIQfJGeWVDjVwofAQxOrYNg5tA8
	Tv0+Q/FQv7e/QxBLPtruqnHEZhs0/YdIhsQxMtrDrgFK6YC+d//iokUe2/J8vo7zaGMXUo5NqWf
	Ou4Xc9XeDn/nXBrr8rvnMLhM3TeBhAsWxngext+X0YAuPe/zoxgS9Gy9arBwKG9DlUqSlV1SRlk
	IHsY+laj6Y1oJSmfChIyejQHJGzIdWa8hn6y4Ql9Oo1a1pSuoFBtI3pw910u2r/W0vhCaCF0eU4
	yIWMxbZ0eao2FkP2CMAatLOM4bpG9Vf7LQJjy6MEXoZOkNd8K323Dctl5pCRXK0uGwcEUmFiekz
	g/Fc/F8N7MMm+lfSNuLD6postkYC/CkBCijhbMPQMdJInhhb/3cU2Lt3BXGXfczf2u8ji8/FBxK
	FG98YJu8+B+xR7ZWg6Auq4ebQaWHGhoPE/vCgfycKycrR3
X-Received: by 2002:a05:6000:4812:b0:4aa:8da8:4bbc with SMTP id ffacd0b85a97d-4abb5702827mr43599220f8f.36.1795777501016;
        Fri, 27 Nov 2026 03:05:01 -0800 (PST)
X-Received: by 2002:a05:6000:4812:b0:4aa:8da8:4bbc with SMTP id ffacd0b85a97d-4abb5702827mr43599159f8f.36.1795777500541;
        Fri, 27 Nov 2026 03:05:00 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm46514173f8f.51.2026.11.27.03.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:05:00 -0800 (PST)
Message-ID: <fa61e083-d6c0-40d2-b25a-f83cad368397@redhat.com>
Date: Fri, 27 Nov 2026 12:04:58 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 net-next 8/9] net: dsa: netc: add PTP two-step
 timestamping support
To: wei.fang@oss.nxp.com, xiaoning.wang@nxp.com, andrew@lunn.ch,
 olteanv@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org,
 richardcochran@gmail.com, linusw@kernel.org, linux@armlinux.org.uk
Cc: wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <20261119030534.1892935-1-wei.fang@oss.nxp.com>
 <20261119030534.1892935-9-wei.fang@oss.nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119030534.1892935-9-wei.fang@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N_yhk1js4FP_dcG9nxJYXxiSzQwuf9R1Qm1DJx9bBwk_1795777501
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 04:05, wei.fang@oss.nxp.com wrote:
> +static void netc_port_tstamp_timeout_work(struct work_struct *work)
> +{
> +	struct netc_port *np = container_of(work, struct netc_port,
> +					    tstamp_timeout_work.work);
> +	struct sk_buff_head free_list;
> +	struct sk_buff *skb, *skb_tmp;
> +
> +	__skb_queue_head_init(&free_list);
> +
> +	spin_lock_bh(&np->tstamp_lock);
> +	skb_queue_walk_safe(&np->tstamp_queue, skb, skb_tmp) {
> +		if (time_is_after_jiffies64(NETC_SKB_CB(skb)->ptp_tx_time +
> +					    NETC_TSTAMP_TIMEOUT))
> +			continue;

Not a blocker, but I think that starting from the tail would be better:
the loop can be stop as soon as non expired skb is seen.

In the hopefully common scenario of no timeouts, the worker will peek
a single skb, instead of traversing a possibly long list.

Can be a follow-up.

/P

