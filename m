Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483AF26B0A9
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 19:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356702; cv=none; b=ssr+G5BC9WUvfUQ6NdOzwb8xZzT6JJZpVeU8OLbIGphHkm9ZwyAa/l911WxRtDRpGEICeQ7ChuaRb2xHci702L6zuXOWEkQQuOfvTTwVwd/SVs8UXoaq3zbUILI3ecTbNGA98zxGvv2zgYCkeIZavYHyeeLVfhleaO9x68b/81A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356702; c=relaxed/simple;
	bh=lJvDpTHJVNBn3MgGbOS1Jg31wusVoMPQ1a05J0GJwgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJ0sHUEGuRV7TCaw19vkLdl03jCtywM0gmQApMxi/2GIyBIcHgoL7iymlLbNijOQYlMxmKSJfGCoRUbTxax/w1adKGJghF6GEqeqgjD0h/QKxuhZTUNMnqcS4zgGqVV0XVSjHJOtOWdTcLwRLv+TsM4zLN1CZ0uS0olh+zPz+Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8Xq6PaP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8Xq6PaP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-480706554beso44747075e9.1
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 11:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771356700; x=1771961500; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xEvfYLLw3IiT9UwT6PYubkbnZroYjQk8ROv2tQqe9bc=;
        b=J8Xq6PaP9T7ynKEZrH0jOZ89aWNU5J6sTvukz9W44jwEFVYRMRJOl6GdoVsS/A96Us
         1R243kx2J6FuCCWtp+kDNnu+cGlLqnlrADKXIPpBCu9ZU7o90Y2h//XQePoVHGIErjXz
         YjQjslBS4AsedMAKrGqpZZeiPywYCXtQQyGj5ej4iHjeB2K/R2ffICIANZXlEQhCri1b
         K8yn7+M23jWjUk1KGhp2GTcmAGVaFsvVTtjynr2kBT0oJCKnJ3WOUyXR0WL8RPxiqaFE
         /+cQB0O1PHnzDvXDDmdqQJwjobwYQy1gaEbchfRt1K4TVQeJLcUrm2wYMIxSAw3BbF1B
         WKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771356700; x=1771961500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEvfYLLw3IiT9UwT6PYubkbnZroYjQk8ROv2tQqe9bc=;
        b=qOREg9QAcwkGnSXV32TWa294v+ujIaCKl6Pm/Q2UuYQJwgflAigy48ujBk7uM7O+so
         FMjfzwa/P4lgqtws5a+09E9UEsJGQaTe0ciTO/TpdUUSAtnHOTdUuqviSv6lRcHQDrWi
         tZnnFCkSJ0IpHCBGmxD0btcg6vPBY4hvnGAGYNLZFxrp67ollpf7V9yp8Ag9SKZvZorS
         WjhYrFz+snGq2R7NBkr48fWDVV7DycmhHGWg9Py/zy0uG//PoCgvV2/YO8PV18U0aCFH
         s+7QPpzKj1JrV0xpDx/iauvv2iKEQ+RhlKRIhrFhJBhYZYuz+2OUJbxvq9OeM1Am/OX9
         /Glw==
X-Forwarded-Encrypted: i=1; AJvYcCXxFEdQiwJAbO9Nd3FD4x7ZhnVE8gh+0GQuH5oaCBvFJHilRMKjGltIfH0zzTNXwWb82LY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyM5zu5dHAbV1/0Oa9TMxtpBP+OSXXWRmUnvufkHr+FhcxmvVxQ
	9mlziPDn/EGgUzirvoVybgyuBZujVsw/3Rb/69+ozwpDIgbzbgrHyYnv
X-Gm-Gg: AZuq6aLPzHlgXxpryhcF1RO23hv7nHkrT91Ys8RXIzwhQ1Oa3sZlNW84L+aNpLqlfyO
	P3lKRNQQnVEwRsE0jaLbyBZqKab9Nr1P6Wg44VzPJ4hHJNygQLhy3yuRqgMaaIBG2Y8A26QeWfT
	TOjUS32H8ygGVaxvXVRljDoI3Wx9pgi5IcOG3j6JH6bbwG/DNUQSlF7zgO304kONsW+2eSQ536A
	M/5qgH5/k3eL9xDhdg/BHCzsD7AujBCY/mbPhSTbwi+whgb/+6LJbRV5tdMj2Qja5tkvOFERyR1
	1aS78W2c9eac6kDsM6Fg8HZviYxVlU8GeNOwTQrgGFbqANkBoODQPYoKTfusHnwGxOIBROZgtRY
	Xe2SkySj9RbKh+488TdLe0ss790KPEcVYhtDGsbQWeIg/cufTzIlKc0FHrN+2/NvseemCzIOa3H
	/VjZIe66DFwmkTJRBsTwUvLift1zzfCJR8C7vE0Pf8chWGr2Fo/cnJvlpGPKYoQchDD0qRtIQfo
	iH3LW8umtGvAPEuRLniaCUIAq9wahgutJMWg7b20K1I1u0=
X-Received: by 2002:a05:600c:1c19:b0:483:5310:dc67 with SMTP id 5b1f17b1804b1-48379be817cmr234399105e9.20.1771356699475;
        Tue, 17 Feb 2026 11:31:39 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48397317e84sm1751885e9.5.2026.02.17.11.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 11:31:39 -0800 (PST)
Date: Tue, 17 Feb 2026 20:31:36 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 03/11] arm64: dts: freescale: imx8mm-var-som: Update
 FEC support with MaxLinear PHY
Message-ID: <aZTCGH1rKWdvYg5-@Lord-Beerus.station>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3b984b93a43a07bc9c4f6414a08a3a0f45daaaa8.1771353301.git.stefano.r@variscite.com>
 <31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch>

Hi Andrew!
> 
> I don't think you say this explicitly anywhere, so i will ask. The PHY
> is on the SOM? The carrier just has magnetics and the RJ45?

Yes, the Ethernet PHY (MXL86110) is physically mounted on the VAR-SOM.
All RGMII signals, MDIO and the LED outputs are routed to the SOM
board-to-board connector. The carrier board only provides the magnetics
and the RJ45 connector.

> 
> >   Two LEDs are defined to match the VAR-SOM carrier design:
> >     * LED@0: Yellow, netdev trigger.
> >     * LED@1: Green, netdev trigger.
> 
> Where are the LEDs? You say "carrier design", so are they on the
> carrier? The DT properties should then be in the .dts file for the
> carrier.
>

The LED signals are driven directly by the PHY and originate on the SOM.
They are exposed on the SOM connector and are typically routed straight
to the RJ45 integrated LEDs on the carrier. For this reason, the LED
configuration belongs in the SOM .dtsi rather than the carrier .dts.

That said, you are right that describing them as "Yellow" and "Green"
ties the description to a specific carrier implementation.
I will drop the `color` property and keep only the LED function and trigger
so that carrier designs can reflect the actual LED implementation if needed.

Does that approach sound acceptable?

As always, thank you for your review.

Best regards,
Stefano
