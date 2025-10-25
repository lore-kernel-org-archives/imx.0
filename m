Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738F9219A79
	for <imx@lists.linux.dev>; Sat, 25 Oct 2025 18:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761417868; cv=none; b=U7jFeTcjYYbqfuDnTAemXA1UJOSg3YKsKzva8kAJD1BjuixBFqYQRnV+nRRxLhJ1+kUkkXFILTVe2bn79wO0SZ0y+jH1C19540PMx059Cyhm52bqOdosGX8NP6QCNdZc3ZgJe8uIPn+3NJVGzxzq9msPgZrEwnQsPbpxp+4sp1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761417868; c=relaxed/simple;
	bh=/cyEYA10fgQiu09txk5WwdgqTqeNROD+BVF14d0FISM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=D7asSWakTk2hLKVNw3rzUemhqgrkduXz3DtjIAL9q4kKg0eNZ5Iu9OD91HKFRjFI61Asdm6Psj2CF/l3JBq8ud60FT3nqShSAjCCFHbKg9U0RpNQX4kJXTabwCBhwNjXftNEPv4VxDxjR3qskcdxggydZUNl33/7MdfmBErQ2jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmxVz9V2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmxVz9V2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-471131d6121so23915675e9.1
        for <imx@lists.linux.dev>; Sat, 25 Oct 2025 11:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761417865; x=1762022665; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dbr82cKNa64aNKIuLx8KwwTVN7eSIBuccWOqj3I0+EI=;
        b=XmxVz9V24rmkaxo+XOVLzlnR5JmBHNPU6wzZrR8cKhHp+0ch/J+ABhzTGE0ZUSSvxK
         fqxGIpQeBpExFnVqANMcJGUgd+r1JDSHho07rSZaqLMVQKko5gq8j6YAv/UcV1ap8RV7
         bGyFLP4e5zTpHadeim2YuZf9KLiI0WrbA3g70HUhNlj8Two8+RpH1NSkyo3qIngH1/2C
         wB8RO1mIYMjZ5BLW6D0MhMgKloJ67dX38zXoc6DJXvNJnJkMiTw9GxpbzoezTwOkJve/
         RlEqLpLouvwjiVWix074b5AKuyXBNGtrFJFFXEzEroBV44tsd5J3tpmM1rpIU517vlDA
         1SvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761417865; x=1762022665;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dbr82cKNa64aNKIuLx8KwwTVN7eSIBuccWOqj3I0+EI=;
        b=bVyNAKdr1PCIBR81BRqvX8x05cDZdEvzXj5VBW2ZAaNUsqZ4p/OVi2gbKxErtWjovx
         HBHEiiKujeYCaPSxLFPzr4hNL2ggGHQHTirZ2X4znDaBx0TTuVix7zKf2KSbeS3PXhtY
         rv8LcTi/Rwyc+MASaERsNNqeWSa5tf7fFh+0QJmBQcZbXFP3Tk2zJUco7HOR9pV+vQT/
         I/Zc5lrUTH0+qvArHOFbR7yaeTEToOawysabquASEGZjmkWRLLNJ6AxBeqLFyG0tEChg
         K3n8C5P5VnDmi31U8xxFvqiAtrwDv0PcMGlpD4lx5guBXZCiV34thh41Kg4jCLy7910H
         U7tQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9i8C1hcHVFjUMxKleKQi9mHEikmDg2DNlmTwEBpMFWXgE+fb+0SlzmwOF5mZcRk8e5I4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy05kyJKaN0F400tEseV3yfH/ydCalIeLvI/3f8iit5kyHiWGqY
	9xr9Sun00jN72nM7TTge+YJEYaodYEhuWt5J6VHO6KHxMzXs+Wky8W38UhXQiQ==
X-Gm-Gg: ASbGncuHOa1fs0WSR7KiZaOFrl8cr3K/1JNEbXCUchydBqPx95DwBrEg4Z1Dq43lL02
	RwxtupHj0VRs4ZR4xCymdqJtS+xcxAL2cBImTei9O2AGhtQPx5/uFhqjxzKzCtImQqtxTJe9P3Q
	Ly/+cPm3LJvVyC1Bg9O1Ap77AmeFBtAxs5NfkltDKxqqZo10CcECQxKe/5m33LH1iAYDAVw+oEo
	LwskixmecCAopzf9TI/gwLM9O//sJuAmlnE9Ccdgm9rlaC9fQEWU7MJI0RzkHRmZ7ZUfHY2/aHC
	vm/jEDkWPsgZJvqIkJ4UpJHvvcdwlBkC6Ic+BfM4mv8BtC+EG0uSuPLhOynUDjV6P8Z/1YUfe/H
	q/NkIhXg2Dy9/aJgla29d9hBr2We94DhrDgjLtUOGqYZe2PLXrMmllT6CFPHJYnsQIpv2KikvIe
	VC+B/b8pfEb8JfK35DqjYLBWLCqmou/MAo+98+VjyVDJYF3xAFnVZTIGId9N9df39Fx4VzZ78Sz
	Niyans3ZWPPvRd/lXgyaXB7FaiyBbIXQBLPjbDZ2H+Knp9mPZlLWA==
X-Google-Smtp-Source: AGHT+IHS0sY82htnysm/29xctr3oax86b635hIkQzKNsnmch9I765g0cmtTSLQtEcDTk6L02Kt82IQ==
X-Received: by 2002:a05:600c:8286:b0:477:bb0:5e0e with SMTP id 5b1f17b1804b1-4770bb05ee9mr3158685e9.20.1761417864696;
        Sat, 25 Oct 2025 11:44:24 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e? (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de. [2003:ea:8f39:8b00:d401:6211:9005:e76e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9c6sm5079902f8f.36.2025.10.25.11.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 11:44:23 -0700 (PDT)
Message-ID: <d56e15cd-900f-4cf6-86c1-2e8000d66f3c@gmail.com>
Date: Sat, 25 Oct 2025 20:44:22 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 0/4] net: phy: add iterator
 mdiobus_for_each_phy
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
References: <9c6aeec5-f651-4cf0-8cca-d2455048e89e@gmail.com>
Content-Language: en-US
In-Reply-To: <9c6aeec5-f651-4cf0-8cca-d2455048e89e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/2025 10:20 PM, Heiner Kallweit wrote:
> Add and use an iterator for all PHY's on a MII bus, and phy_find_next()
> as a prerequisite.
> 
> v2:
> - rename iterator to mdiobus_for_each_phy
> 
> Heiner Kallweit (4):
>   net: phy: add iterator mdiobus_for_each_phy
>   net: fec: use new iterator mdiobus_for_each_phy
>   net: davinci_mdio: use new iterator mdiobus_for_each_phy
>   net: phy: use new iterator mdiobus_for_each_phy in
>     mdiobus_prevent_c45_scan
> 
>  drivers/net/ethernet/freescale/fec_main.c |  8 ++------
>  drivers/net/ethernet/ti/davinci_mdio.c    | 14 +++++---------
>  drivers/net/phy/mdio_bus_provider.c       | 13 ++++---------
>  drivers/net/phy/phy_device.c              | 14 +++++++-------
>  include/linux/phy.h                       | 11 ++++++++++-
>  5 files changed, 28 insertions(+), 32 deletions(-)
> 
Because of the needed v3:

--
pw-bot: cr
