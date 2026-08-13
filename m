Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F5736215D
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 07:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786606546; cv=none; b=dtCy4nKsmPUh0jqcvI/6W2547+MqBHj0iv/BAukqkPiy544ft2ksLokf9GL64zQCD+HPq1izQ1OldU7aiwFwonah6mq9JHQmME6RfI3LR2ow5nWlvWrH7Nr1U51wolkdOracDbx+Ns7Tx2Wpeg+qN6kCC0R4oZcvPv/q66XSIjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786606546; c=relaxed/simple;
	bh=OOWzDX1YKMNMoQ5LC/5VE22Nw4ov3tCVcxDaDB2Mvzs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SIm4qcZVqqlB1eTRLK6jYrfuxUbmuN+dtgj6HzJ5HntvVSr+7mrCoahmzD/IQxLHoFB0pqgRnUrSibn5GNxwZy/YAdljbE5TpfREeZFs0DXC6UDKcyCqjvLa4DKLlE1TQSSORzOGaCiVf2lrug4n1O8bgRs2MXiGB5ij83fgrGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FO62sadG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FO62sadG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786606543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JN2pldkYM0RMPQtKgx5//Z+4qj7wz5yY5RCZ6A/tGpk=;
	b=FO62sadGbj6D5gjveynFdWw/AqzHTAIzfRp19q+3Y6hl0LrxYQq8gEZYWBJEgJLeUz9YKA
	rmpw7NFeeee/AELcpH2ny/I6hMSTWrSSVvhqU2KVO9hRwgEkV0skhswOw8/0BUv4p2GA36
	mIQRK8ZUtj2mJq02+55xZOYYlViB6L0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-3TaJT0HaMd-2eE2_sIyO2Q-1; Thu, 13 Aug 2026 03:35:42 -0400
X-MC-Unique: 3TaJT0HaMd-2eE2_sIyO2Q-1
X-Mimecast-MFC-AGG-ID: 3TaJT0HaMd-2eE2_sIyO2Q_1786606541
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4955d314945so1764245e9.0
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 00:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786606541; x=1787211341;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JN2pldkYM0RMPQtKgx5//Z+4qj7wz5yY5RCZ6A/tGpk=;
        b=UfXI+Fik8YTN/AOVtJ22KzxrR0d8UwikgST1yqdHk7lu+OfzVC0JyCeQpswAtVQ2Yz
         Fi9lEHtL/kJszAPEGRewQ3lzG6fJgmlCaM4FCwVRpY1hYmsNPU+tUBBKtFCM/zYi5BgJ
         96lcNr0bgy6tBRwpywykAUDAslU32ynQXYDOFBgZhahHHaOx/aExQbBXOjGl0AefHNC1
         mx8LAUo5HU9Wk7TR2JPAw8G1GIKJQu/RCeTcEzhy44S7vm0InrvkIcfQ+KmZjPTVxCPc
         0QC1j7rZkU8Df2PvWjI2WcrBX3PxIak32Gva//VaOUv48EQFyk0D31iwKWzAG8rFSGbu
         oeyQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2+DpKD8Nr3OXuEsTuJ1PgDtw1BYxCT5aloUpHUX7S1T2j+OuO7FX73cb9I6WSl3MhSoA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkMkVYMDZPSvD+24SPWEFSJ30LnsILfab3lS9H3LFyIC6zuyVE
	AGAG4CSKTJemedXnkrX1RSMirr3xDGELTcx8ltdM19fuAv8hTd1291uNg7NKaNLfoMUa/jerQDX
	rIDx8qKrrqNq4MOAtipXzLKv9Yoew5U5NL+t10l5QzGPrMkWMya3heA==
X-Gm-Gg: AR+sD115U2isvc7khCGc2ExZE32kcPTlnK+Iys0+7yrL076tBEOmi1AfaLgtRzuEM9A
	KVZx3NULpTAqjwfYV9Dot8f6PTfPdgbue/GpIDebqSITENzvIdCVqamJWfrzt44I6ntM0SDdyyD
	g8HEIZ+BL5BNVLShchGASO5x6bDY6t5WFFgMFGEuJzU99KQ+icnjEdXJTjl4ujIhYzUjymVOpJW
	KFG0+a4OwMC1Rm/EbPb2q9I9PRHGlYavLi08yJvPlUQcFp4DvxhlyjIvBJzb//PjOTCjd2dIk8I
	8LCgQ1BbCXQDQhcpcSqMrR/Ch7xbXkP95HcoLe5G6KvKZ6m2DcRmR1jHt+fABIBlHsl5Cqt9
X-Received: by 2002:a05:600c:19d1:b0:493:bb6b:5bb5 with SMTP id 5b1f17b1804b1-499821f2a66mr36070085e9.13.1786606540854;
        Thu, 13 Aug 2026 00:35:40 -0700 (PDT)
X-Received: by 2002:a05:600c:19d1:b0:493:bb6b:5bb5 with SMTP id 5b1f17b1804b1-499821f2a66mr36069425e9.13.1786606540475;
        Thu, 13 Aug 2026 00:35:40 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.115.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981d9613fsm105709945e9.0.2026.08.13.00.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 00:35:39 -0700 (PDT)
Message-ID: <b82da069-b76c-47f6-bf8e-f47701cb318e@redhat.com>
Date: Thu, 13 Aug 2026 09:35:38 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: imx: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 header file
From: Thomas Huth <thuth@redhat.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260619122448.188046-1-thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260619122448.188046-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WKYDJ1DdkcxnCpbeda4yDaCdSqzSq3lfvvYRZubekFk_1786606541
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2026 14.24, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize now
> on the __ASSEMBLER__ macro that is provided by the compilers.
> 
> This is a completely mechanical patch (done with a simple "sed -i"
> statement).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Note: This patch has been split from an earlier bigger patch of
>   mine to ease reviewing.
> 
>   include/soc/imx/cpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/soc/imx/cpu.h b/include/soc/imx/cpu.h
> index 0bf610acafd06..8c53150acd76e 100644
> --- a/include/soc/imx/cpu.h
> +++ b/include/soc/imx/cpu.h
> @@ -30,7 +30,7 @@
>   #define MXC_CPU_VF600		0x600
>   #define MXC_CPU_VF610		(MXC_CPU_VF600 | MXC_CPU_VFx10)
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   extern unsigned int __mxc_cpu_type;
>   #endif
>   

Friendly ping!

Could anybody please pick this up? Thanks!

  Thomas

