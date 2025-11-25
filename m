Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071FC2BF001
	for <imx@lists.linux.dev>; Tue, 25 Nov 2025 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764065114; cv=none; b=B6RizUDLo64FfUj82XQDQ1w+k9FPkKUjkOSrT9gcQizfSeZlN5ezYUFxEriLLnTxr9vabm6jiIOY8q+HbTVwZaBEEtFFS75S8YzZHdtFtnauStt7YdKmwzEHP1//W6Xo+EQ91CGXnBz91id8AEdhAEuz9GzlOP6L5o8hPEoTMEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764065114; c=relaxed/simple;
	bh=Tvut4rKFuaZuRy+MpiRjhCbO3OPGk1QYOL3k9etbC0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riRbOMZ7+MJ2PPOs1OQisYXWwFFls6toWS1j/4/xdnmo4aZN+VJGsRT1ntecbOgEIlQTsLBH5CCOgy5RN/7n7woen7UrhtyVR16NqnqP2FS/sBUUqt5q8SzceBY6mcxYBG5ZFcBJ2OhOor5A2aglQDaqBLpAKzE5v7ac3h8KRGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JUXZMmIG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JUXZMmIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764065111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Du2XvNcpBpgsVAjcJWW200tMdW4BN0igIjQyXWLtpA=;
	b=JUXZMmIGKosGqxzh0TcLMzfQ/5ypZT4yWSsJl0dxbh67EaxKWBnpouT70l+lJUBAc2369D
	tAUq/Tt5TSaWPQVbZFt9LyFWOFdOrHpQC7NNRfFgkgFx55B0yiKklmc9tsC5eFnNyQ5jVL
	QLvJ4pkRSDwcjcrWX79wNp8Ie9+W5Mo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-BcE3ZPG2OUiHtamRJInydw-1; Tue, 25 Nov 2025 05:05:10 -0500
X-MC-Unique: BcE3ZPG2OUiHtamRJInydw-1
X-Mimecast-MFC-AGG-ID: BcE3ZPG2OUiHtamRJInydw_1764065109
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4779edba8f3so41529925e9.3
        for <imx@lists.linux.dev>; Tue, 25 Nov 2025 02:05:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764065109; x=1764669909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Du2XvNcpBpgsVAjcJWW200tMdW4BN0igIjQyXWLtpA=;
        b=DWxgBZZdfPmBXmZeOhA3R/wrfVUGVuF4Exjfxv+VwfxKyxZGmaMXxjwebC8xDvcrXI
         120jNTSiZg+UOOsaRqFhkCrZNH5T7KEV18VWoOi+nd1fyGVXnofmrsW5Kl2W0Aul1xIB
         pUp6LFss9r7o9D0tQCOLBvMPYSYyyPwgTpos9EZiwzeTAbRfyh0fJ3PRB0TPpS/IesIY
         /lbDoOvvE+/KBHTIbJ40vDUeZgNjDvZb/TDpHl00pSlTr+4ohCZRL9ScNUxSSND1JGAt
         /17jg4dAbArxr/nrbr0X08aUyRNEB7yV9qeAXShbWqJeOEp6kRDjaYsv1ptJRq3FSlHe
         fW5g==
X-Forwarded-Encrypted: i=1; AJvYcCWXjIdcRaqn9ZBdbVmlcXh23gxQ1BOC7CWHT+5JplfTPmfuNofN0lPcv8rtuJCR06YszOA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZAui6nBpdFborq3YyJSEE+FTqTEYikLpRZaF+Ilum0btffIU+
	Twbmz9s4O28l6OCXNo3oFl6CW67wOqOOJp9XivMNtfw0IHusEY5u6NjgseMRdxP6Sp8wnMVPBrJ
	xIUlR5riNhVCdyFH5+grd1sXibYV3mAd2PSlvSmiPELanFMPs2YZ4dw==
X-Gm-Gg: ASbGnctQsz1otYbPfKGoq1hWiD8sujJzKQbplDTfspaZ6wUKQx/llSM1t+XsmHZcI8q
	iwMTPzcsR5AKGJrTrcQLFEEMl/GML6o201S16HqPkv9dH/Ba+2PKuHh5W0yNg/mmBnsD0EYP5HF
	yXoxrcTbzIdakMvXyYsrRHF9fpkAJtNDRqEe/AMwQgKUoaWrJOljy1dAOCOwdZO8T2oYiZFQUMT
	1wGeGDX5Do+EXsABHECEGF7qV7zM0p7KimJlGaGujqLwHMMdpdwAOL2wn8oC+zNWCaYzKzRyNQj
	YK2aOfriu/XD7YCgmOUKdbETZk4IBIKZaVpwd6udtjsAVS8UhClQRlIsclXpnWrQdBERlwnFLTR
	+7cRzvxxE1mn2TQ==
X-Received: by 2002:a05:600c:3541:b0:477:9650:3184 with SMTP id 5b1f17b1804b1-477c0165bc3mr141142485e9.2.1764065109396;
        Tue, 25 Nov 2025 02:05:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdw5BhuyWaRQOc8C580uVcASiaAfZ16Z89gL80wDsCpr6kPhgTQUxoRiGKflA0cavmZi684g==
X-Received: by 2002:a05:600c:3541:b0:477:9650:3184 with SMTP id 5b1f17b1804b1-477c0165bc3mr141142165e9.2.1764065109027;
        Tue, 25 Nov 2025 02:05:09 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf22dfcesm246385055e9.13.2025.11.25.02.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 02:05:07 -0800 (PST)
Message-ID: <46765613-9a04-454b-8555-21f6fd965008@redhat.com>
Date: Tue, 25 Nov 2025 11:05:06 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 net-next 3/3] net: enetc: update the base address of
 port MDIO registers for ENETC v4
To: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org
Cc: aziz.sellami@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251119102557.1041881-1-wei.fang@nxp.com>
 <20251119102557.1041881-4-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251119102557.1041881-4-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zTD6sw_0lYHffBBJzMfl5OuG66de9zzFR7ZCek-JQXk_1764065109
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/25 11:25 AM, Wei Fang wrote:
> Each ENETC has a set of external MDIO registers to access its external
> PHY based on its port EMDIO bus, these registers are used for MDIO bus
> access, such as setting the PHY address, PHY register address and value,
> read or write operations, C22 or C45 format, etc. The base address of
> this set of registers has been modified in ENETC v4 and is different
> from that in ENETC v1. So the base address needs to be updated so that
> ENETC v4 can use port MDIO to manage its own external PHY.
> 
> Additionally, if ENETC has the PCS layer, it also has a set of internal
> MDIO registers for managing its on-die PHY (PCS/Serdes). The base address
> of this set of registers is also different from that of ENETC v1, so the
> base address also needs to be updated so that ENETC v4 can support the
> management of on-die PHY through the internal MDIO bus.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Andrew, it's not clear to me if you are with the current patch version,
could you please chime-in?

Thanks,

Paolo


