Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900684;
	b=jkroSqzI+s4HS/ndfrIWg5PYPECxUZU9x6iVmQT+nOPRoHJFj9rtp6VgG+gQNKR6KR7G
	 I1/1+uw/z2auH6Z5kzjbTmw1dAxUqxztl9LMl1nfmIJ/8qlycS/oKOcOVq4sSSwl8l2wd
	 PIROck6KQi1NqP51xNmfBuQjEWwR2EFf9aS33NW9PvmB8/ideKOzlwZ6sGMwoVllJn7Ye
	 k/H+KUtUN6nCiqr7sYaQSatqsgWC0ulRz4BFjk4XoOlgcB6zUij5Rmt95KwtMhlE03lp8
	 IhbM77aVKTo5T2R3x6dh1bYBzhBTrbuCnOzXDvlwGr04aFKZg4pS3ONo0qeKsCbK7lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=U90OTq4pj/0GvT/BUYUlBl9XzS2MommQVkNoZ4ZcGPU=;
	b=W/+gZKsOTZ6QorRkwi8buPkMnp2AbWy7WBprp9IHxYMaOyxKUcrn1TEC1OkpaYNjFfgN
	 BlGQ2sOnfnGufqW2iBRFJT13TRPBF55vBTeDt8BOYj003FgZLydCZvdqtrjkA4Xnbhfug
	 KBRz9zV0kTeGWhqpBblPcUH5GROiGRDMQJGKM7QuY8GJbCafbfEUiMOJ4VcbfFn9qdSUb
	 5mpSTy57jkizqcWNbEscPPtVavO5d/ijodGg3gqzNskb99N40fpXTKnfQz38w8Fl6WbKf
	 iOsJ8RtAvHjUXMSKA3xV/mt6zzkEXBYaHIwLS/ekQitLoRufDfSejE3F7amrQ3cxFUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X1Sr+3IN;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489E0606D803
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 17:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 489E0606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X1Sr+3IN
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so24389125e9.2
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 09:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900683; x=1794505483; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U90OTq4pj/0GvT/BUYUlBl9XzS2MommQVkNoZ4ZcGPU=;
        b=X1Sr+3IN407qO0n/5zx4xd22Z7feeX4Aalvw6xXLrLoSQ6vgD7TxWAmCOh1NuZcBUp
         cK7DTjMeeJE94XL42Db+q5WVMsQ1bhDivM9dQnMdrH8yCL7L5AmmzK8KoZWR08MmR93u
         n9nX9101+eXN2Hy3b0eF6J0FggJmdmS5F7htXI2ba8v3yf7+OihM58JS283MTUFx3wCA
         JOLoTIW3GRODBIWWFcQ990LMcOxixM7DekZA3YzwC6AYMwgdjbbu3TpQJwl+8AnMqyKJ
         jnR1u6fREPlkxo9VXdCImCVdWpyDmE5aozods2/rNg8tYUrpfFjm42Tp3NA/insuUiDR
         1iLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900683; x=1794505483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U90OTq4pj/0GvT/BUYUlBl9XzS2MommQVkNoZ4ZcGPU=;
        b=BRgKol1jqlLk6JP4L/3fQX04n0g7Azj16fdnnrknOB43A32UBT6R25kB06xwtckGUf
         +D1uv659nLuRKfMBvluzfzOjYL4y9Ur07KdswtpyNUDFTyiJPBthHafRgoZfXQpa3drn
         Bo7UozQV+YHTX8JwsRXK9OH6Qr8JfIPIkQBo6nH/w2pMJ9wDk++Hr/2kk6JI1ISWhsA2
         0CnsO1LbD7lmofbPS5zl3HlQSLumtgOsdhhEqZs/iegudo+yabe5A/SHVsWtxe+7/r3j
         t5fBW0Ifo7j0V7VXgXc9GxzcKLEobKInNcy2wonaIGjILujvZXgv+pVI0N4WkOn/fYnn
         KR7A==
X-Forwarded-Encrypted: i=1; AKwUvByGq7AQhBfEeiIbqEecbHUPrNkR5cTwb5mf2zL4y1AV8t5Ns9abfFPWj3gvwu37UD/BHyc=@lists.linux.dev
X-Gm-Message-State: APuU4Z/kkeXCu1KsE8oiX/AYKTfM2L3KKLV7M1PAJiDQuFKoYREq8OcT
	/L8U7makxW501YEfkidhf9GnTvgdl+3n+Ge8Soze2r/y5yUAxmEZ/hWk
X-Gm-Gg: AYBFou0+Hk52/K2/vjs/ggOlTMwvue5nWMzgPOWwQOwnqIYZrgzyiswaAKO7I5tYl4C
	7cSvLN8yE39r+xA6LW/RO8Gg4OH5wmts2848ePeubIzJ6cuE3J568uwZ4l8y6nqdHP//JYIEb2e
	776DxvA5y9Lh11mLJ0MBM0bRxH+ifhRv7XFiQCKpp0V40vNLfVGhEvHv/eAxpFIid0pTpcIys17
	daqRKYo/RToNJTAQ8gyS2U38bI6EWHrH7UpCkSjeqIVhOURCllYFTOfRHsk6azPfVTrWX0oTH33
	NpQ1iBLhp+0Q6U+ubxon5H+1wiyamm2iWKuWpheUx+L/KV1qDNTiu83D1xSs2h7H2ImoHMhvXyL
	uVdG6oWqn9MCl+i56eY9EdzzSLpehlU6L63SYEu7VlZwRLsNrt56KnTFqeXSh+XRNTHWn9xTE9Y
	Ur0GLNfHJxNnMJFtbgYuc0KgDE8W8mVH3B/Epzi97adG9ijIuUbebPTSVHWOEts1YZAO1wYuCNb
	ooy3L0qNtMlAGquCKhz5Hke6SIi71xgGJ7bYt8EWpiuArv+mDl5B/wxprTz2yRKVcy8n1ar8bY+
	jeBwyNzFadqK2oIBbOvQCRGtDYkRZ/0vGLpy7P7CjjdRQE5HEolocPpLLrxxpcrTRyNpppQ5x7n
	CT08hBTaWyU9GJcMJSlkgDH3Kcy6ZSVuK7SPpP2s2VMO+nSKllQcNnIzM9A==
X-Received: by 2002:a05:600c:8b66:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4ac1793f8ddmr454773675e9.14.1793900682397;
        Thu, 05 Nov 2026 09:44:42 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm86889775e9.0.2026.11.05.09.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:44:41 -0800 (PST)
Date: Thu, 5 Nov 2026 18:44:39 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Nate.D@variscite.com, Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet
 LEDs to carrier boards
Message-ID: <auzAh7404GAsY-U0@Lord-Beerus.station>
References: <20261105101739.10614-1-stefano.r@variscite.com>
 <auy-OW_td7N8oHK_@SMW015318>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auy-OW_td7N8oHK_@SMW015318>

On Thu, Nov 05, 2026 at 11:34:49AM -0600, Frank Li wrote:
> On Thu, Nov 05, 2026 at 11:17:39AM +0100, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > The Ethernet LEDs are physically on the carrier boards, but the
> > VAR-SOM-MX8MP, DART-MX91, VAR-SOM-MX93 and DART-MX95 module descriptions
> > include their LED nodes. Other carriers therefore inherit LED definitions
> > that may not match their wiring.
> 
> what's impact?
> 

Hi Frank,

There are two main points:

1. The SOM dtsi is intended to be reused with different carriers.
   Defining the LEDs there forces every carrier to inherit the reference
   board’s LED configuration. Customers then have to override those
   definitions or explicitly delete the LED nodes if their carrier has no LEDs.
   Keeping the definitions in the carrier DTS avoids requiring customers
   to undo configuration for hardware that is not part of the SoM.

2. The Ethernet connectors, LEDs and their wiring are on the carrier.
   Their definitions therefore belong in the carrier DTS, while the SOM dtsi
   should describe the hardware on the module.
   This change makes that separation consistent across our boards.

There is no functional change for the existing Symphony and Sonata boards:
their final device trees retain the same LED configuration.

Thank you Frank,
Best Regards,
Stefano
