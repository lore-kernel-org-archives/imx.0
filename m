Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8542F5461
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 16:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767631349; cv=none; b=SzmrEjW+9d/h7h9na5K2TZ6eEMzgztCV6QGEMGQ0L4WlqbtP0u+ml0x6MkOyNFP4GO0js+UgQ0m8gkCy70pqq318QPfyCx/Pw+3mguMnlDs8A4X8ElCwOSDTgtMyBmhXKbRWGp01amR/BUg81y5Sti8/LFx8W17XKPiItaPOv/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767631349; c=relaxed/simple;
	bh=m1cWU1c28IHidxYRJfjMgPQezz6qGL1YM01BII9uEjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olq/RIXJjZeoIIQ4nZFg333oChLhL5B/Ki7Bh3i3TYAZZfJ2NpAUbR09duOIqyxPYsUapzYtPsU2SbQ9TUFeIy1dCqwJZtqiUBSj4l7HU8LqeD9mBXHJ5SIr5jlDWcRwCAOXqasQbVMjyAJ9pNkfAZUd6vgwc8hDGxobwQ31v8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hi9y5rvC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hi9y5rvC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso638795e9.1
        for <imx@lists.linux.dev>; Mon, 05 Jan 2026 08:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767631345; x=1768236145; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OyCREwze6wuRU2UsbFO8TEdIlanzdvvtH1ABUGO9pDk=;
        b=Hi9y5rvCaGM3t2q8rmM6oB6D1P8agpYF+BlIDhfw+2uoyIqOk9H/Fe6u77dB96m8HD
         bfQaXn13vEIQ55jK4JtFnW1n0taK8EdaramTrT88pNKEmoelxG+nnFCdqovmj39wtTdk
         8HHlvbMHjb67hmhntXhEeTGwh4Io2UWupOfMSwDofcyqlPkTFC8QnmP6k6s9HoSGau23
         Gc2+ilXVby73gqde3A4i6Z9Rq+/s5hDSDlk0ulH/CpmK/BjErZ9fYNurPBIz7Q9DVfSq
         zFw9FlTFBjrpgWxV52yDbuc9i9WflGDQ5/fzqrNQPrtGtHJsh+4O84dhTvpaadBoH71n
         GLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767631345; x=1768236145;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OyCREwze6wuRU2UsbFO8TEdIlanzdvvtH1ABUGO9pDk=;
        b=nlCsNF62vOD24mJqqwHPvNvYtqPW40V0LO5+datW2ANwgdzkOvbaS++bFBpjn8v1xf
         ZFPNdnqr7IsRQYj6fK0brQhaN4qMFP2Hen8NRIf/uFuItejYTG9zT6k8zj1QZ0kJRnnv
         nZNnvvhMb5P56px2Zjntg9/6+JxYwEVFSYvpfrYuhBqpsf2iCFudYeIJPj4WS9lHLxUl
         NAvdfblrTjocfEwg7MPmGWMt8wokAKw8y2nwHvWTVQExZ0yTBrTNZ0d/Ml6ig6KUDMvq
         HgSPdGz8TaJqI13ZS9Igis3hTyIwfc22mz/0PCW2BzTZoRw60VmnEX8LdJ3Q8mL7WWYH
         MgnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx+vey/Em8epC1GwNWg5l80iWAHmSYcu1KEoJV5oI2w+tq609U4bX6Hur+xFzhnHjt4jU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb9feAw9SOuNiDrYEHHQClnWXbkkBNWaWsG/uTskyJQrFvdDlg
	pVBeADZHYCBL5vGzj7D/kDk8jqrsF87Sk+30glz5yxh72HVC8mFHhYg8
X-Gm-Gg: AY/fxX68OhZUIG8xqBhe31cu56nYpE2JaXLEtjud8cZA2KRnC0o5jdsQS8oZ7w97lP8
	SfP6Cnk+xLPi5MNoN3w0JfDNXWo5BWzHcLJO/Omho8G+xx4tga/p3E6zdhZCOZGH7lDqf20t0ha
	M4r2e1Exq8FmkpkxskrVncTz5YhPa8+1rIBv8bHqwTHW3kC9nHOQPf93wb8Ehv1A+MyXXOdYyDF
	tIzH7NN2qT/zNpX7ANchGiMyMzk6kNJieM2twRDH437caUyGtVcCpp5o5xKaz0ZZrv+fKRRig4G
	1mSi6/grJe7KBRTZh+6lHoF02baHhuvGSS+OatdYcb+RN19gcve8K9ZcLJ8wNyHHPtbpdsYuW4C
	e9/i/+HhZ524EK3IevPZY4j8aGx8keLgGwHkE9B9wXe67E+DY9xCeikX7APqbUCsCGzJgClzLbv
	WdKnJuz1SxX8o=
X-Google-Smtp-Source: AGHT+IE/JjorzXLwwkJgsbApvm+a3QMCRUUp3o9LGdUjHP2iI1zq9V8yb9BydDK6HAKwFcoQXH8UFg==
X-Received: by 2002:a05:600c:1c29:b0:46e:37a7:48d1 with SMTP id 5b1f17b1804b1-47d1959d4bamr704429525e9.34.1767631345377;
        Mon, 05 Jan 2026 08:42:25 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:20bb:19ed:fbb2:7e2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bca532c6sm442805f8f.27.2026.01.05.08.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 08:42:24 -0800 (PST)
Date: Mon, 5 Jan 2026 17:42:23 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, francesco.dolcini@toradex.com,
	robh@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for
 the Micrel KSZ9131 PHY
Message-ID: <aVvp70S2Lr3o_jyB@eichest-laptop>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>

Hi Andrew,

On Mon, Jan 05, 2026 at 04:26:40PM +0100, Andrew Lunn wrote:
> > Unfortunately, I'm afraid of breaking something on the platforms
> > that are already working, as this is an Ethernet controller
> > issue. As I understand it, the PHY works according to the standard.
> 
> What is the exact wording of the standard? I'm assuming this is IEEE
> 802.3?  Please could you quote the relevant part.

Yes this is correct. ERR050694 from NXP states:
The IEEE 802.3 standard states that, in MII/GMII modes, the byte
preceding the SFD (0xD5), SMD-S (0xE6,0x4C, 0x7F, or 0xB3), or SMD-C
(0x61, 0x52, 0x9E, or 0x2A) byte can be a non-PREAMBLE byte or there can
be no preceding preamble byte. The MAC receiver must successfully
receive a packet without any preamble(0x55) byte preceding the SFD,
SMD-S, or SMD-C byte.
However due to the defect, in configurations where frame preemption is
enabled, when preamble byte does not precede the SFD, SMD-S, or SMD-C
byte, the received packet is discarded by the MAC receiver. This is
because, the start-of-packet detection logic of the MAC receiver
incorrectly checks for a preamble byte.

NXP refers to IEEE 802.3 where in clause 35.2.3.2.2 Receive case (GMII)
they show two tables one where the preamble is preceding the SFD and one
where it is not. The text says:
The operation of 1000 Mb/s PHYs can result in shrinkage of the preamble
between transmission at the source GMII and reception at the destination
GMII. Table 35–3 depicts the case where no preamble bytes are conveyed
across the GMII. This case may not be possible with a specific PHY, but
illustrates the minimum preamble with which MAC shall be able to
operate. Table 35–4 depicts the case where the entire preamble is
conveyed across the GMII.

We would change the behavior from "no preamble is preceding SFD" to "the
enitre preamble is preceding SFD". Both are listed in the standard and
shall be supported by the MAC.

I hope this helps.

Regards,
Stefan
