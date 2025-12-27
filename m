Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47495314B77
	for <imx@lists.linux.dev>; Sat, 27 Dec 2025 16:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766852680; cv=none; b=jlKF0hyPtt8LD0OxjXZ16Gcs80tHWinLsCd/wUmYEel9vbuT5xWMGY1+g95hXe7IhUeWHkdLAP3a/wkYBibeKtxygZD3EpJqzRe5lUGvYWkygy3nghZTHbRCyQRMvTAO11hKh0AEdXLqabbao7oywNlrK6rzTbx6Om9pWfDLDDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766852680; c=relaxed/simple;
	bh=8YNXVPWR0u96ITfCMf9F3KyEcp7wyChe154P/vlG+F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjEZv8fxAbykWg3M2xKW7QZMLYn4CBASveZFT5sxvepPz1OcyFpUC8KC66SAn9awWqxY+nkqYQ43gDvNkGoeO4gv9AK0XQXi7IPm6S9UvhmSjpT2R3eh8J4Vk1ZbLa/jpA8xWvrV6ZPvKjSZlHJj1S3jiSU9VzHezYQE5bJ1J1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YfWK07ZZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YfWK07ZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766852678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/0pFoW0fxxbGtsoDZJaaxbA0XpDtBn2L+88OYPdKiVs=;
	b=YfWK07ZZ3bqY4jAUY4IdVwC/dftD/H0oQM9okyCrKIDqfjvhnc3e4te4zcM5RCkbk4uTCD
	ADNa3iszQ6CQCB6on6V4ccgFF+3drdA73pJaZEe3jT4+21MxodsUWWM2CQC0SCwp1Nzi+q
	qSozPUglKjQbfTMnAAYBWN6PxvWnL+0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-_3AGM1wAN-Gnnu8EFGTqbA-1; Sat, 27 Dec 2025 11:24:36 -0500
X-MC-Unique: _3AGM1wAN-Gnnu8EFGTqbA-1
X-Mimecast-MFC-AGG-ID: _3AGM1wAN-Gnnu8EFGTqbA_1766852675
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47904cdb9bbso71784935e9.1
        for <imx@lists.linux.dev>; Sat, 27 Dec 2025 08:24:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766852675; x=1767457475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0pFoW0fxxbGtsoDZJaaxbA0XpDtBn2L+88OYPdKiVs=;
        b=LXaHS336hTUg8SglnlAjpCAzKOPsLM69OfcTYYNqxbas0/1aRiBm9PP1R+qiQc/VmB
         tlzxrXrLDfk41cagSj9nD+Eir3kN6qkIgvvFcdAeJkGtNXmF3rqf4Qw6NejRgcVQKV4A
         +a9T9gz3CJlL0gK1256sWdiY6BC7Lr6GATCS3sWqNM4ZpBXU43/Mb0uRxeEeA/KTyg94
         g//H+uOXIhXg0DvNX2r+XY4DAyxjI9xwSTfSZ3MBUICe/c8JURWbq7bp4zDX2nF95aLo
         geSjbGwIglVFDTWXdoQvv9E2PInpJvb6SHhtVGsUQKb1toMIyZHSJMjncxLtI6yHXrch
         /Msg==
X-Forwarded-Encrypted: i=1; AJvYcCWtrLIJTT0kagkECt4TZ3ej74Bd44Xb1z58HCmRu4pYFVLAtSVnFrEAV6hSusqqF5wQgH8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdu9h5zOlzlvmtGgfCZy83Zz2VlGcn/kb1iEX6k7vFQShQN948
	lbceCZcg/rulWRyjPoN8i9jt+PMb+5afgdEB96jmAssq5ZhgfRAujua1+nWnF33bZZX8AqlMguI
	94C0iNLwFN+0b0shpgy971XwtU9VN3hnYdkuF4Eh+3vU/+R8aAIJnFw==
X-Gm-Gg: AY/fxX5TeQPAI1mUM6M+8bahgFns7O4tNdi1mmmfOlxhrexRPuu/dpLA6+6NViGL7rs
	i4sqUuGiV1Fa+8eC03tb5lNetFSf3smYyDIxDMsus4xrdhvzaPelIM9g+aXzvQOBM8EMS4dMB+t
	PJFwv0tywimdj4qJhyYG4NI0VNzfqZT4jVcM9Vs3hg/5nzpLXyj/onqA6hUQEtLhghXUQzJusRA
	5qndbCccWTO1aDg0zj3kWyXR5LCoNEg/rn8Qw+SMRY/DuKN6ENc78TjCb69TexCzOrVJ25iAfSo
	/ap5f1zVAOaF9gkMUA8wXSi4nCQgU7pSibIT8d886KxWB/uYhwVeizMkmUaGGvlhNUMSneZ0Huc
	DY0oM4XTTlVesrQ==
X-Received: by 2002:a05:600c:4746:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-47d18be144fmr257527175e9.14.1766852675264;
        Sat, 27 Dec 2025 08:24:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+n6rR4mCRXdumkBNyVc/341HA3AYN1kUq6F6siD1Lcd+ziTKXrb+aL7jp1MXCilbI6b58Tg==
X-Received: by 2002:a05:600c:4746:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-47d18be144fmr257526865e9.14.1766852674879;
        Sat, 27 Dec 2025 08:24:34 -0800 (PST)
Received: from [192.168.88.32] ([169.155.232.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be396c909sm194725735e9.0.2025.12.27.08.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 08:24:34 -0800 (PST)
Message-ID: <80be718c-3592-43bf-b3ab-8e1b9d3cf41a@redhat.com>
Date: Sat, 27 Dec 2025 17:24:31 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: stmmac: dwmac: Add a fixup for the
 Micrel KSZ9131 PHY
To: Stefan Eichenberger <eichest@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, robh@kernel.org,
 francesco.dolcini@toradex.com,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>
References: <20251223101240.10634-1-eichest@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251223101240.10634-1-eichest@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IN7etofTJO3yNWYdb1XewOZz6Cysxzt__doMEVnjq2s_1766852675
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/23/25 11:10 AM, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Add a fixup to the stmmac driver to keep the preamble before the SFD
> (Start Frame Delimiter) on the Micrel KSZ9131 PHY when the driver is
> used on an NXP i.MX8MP SoC.
> 
> This allows to workaround errata ERR050694 of the NXP i.MX8MP that
> states:
> ENET_QOS: MAC incorrectly discards the received packets when Preamble
> Byte does not precede SFD or SMD.
> 
> The bit which disables this feature is not documented in the datasheet
> from Micrel, but has been found by NXP and Micrel following this
> discussion:
> https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032
> 
> It has been tested on Verdin iMX8MP from Toradex by forcing the PHY to
> 10MBit. Without bit 2 being set in the remote loopback register, no
> packets are received. With the bit set, reception works fine.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

## Form letter - net-next-closed

The net-next tree is closed for new drivers, features, code refactoring
and optimizations due to the merge window and the winter break. We are
currently accepting bug fixes only.

Please repost when net-next reopens after Jan 2nd.

RFC patches sent for review only are obviously welcome at any time.

