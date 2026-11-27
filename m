Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772002;
	b=rGvpIJaiSKDMZUBGwo131WXoJ2Amz7y5uQb0jE9VVclApIjpxeih352ziNW+Colpk4D+
	 gsOxYJ36fMxyV9/bYxB1zk5yZyBPnagRRTxw6oQiRNovzYU869OWwBahTpOei+QxRUtTm
	 irftTNi3i/OZsHljxueOWADpbt9D79SesKLHEjFP7/SYP3mGpQSF6el+FrHqN/qbSOOc2
	 a9qHDRWPQunzN8HLRord6dGC553VXLIcFFqZSpaK80XIer1IOmwCuuk6l/Pt1RfDbCGK9
	 cOTbrmICzNVf2iR+IiMrIJvIWH8u9EncngJZla/umKzR4u47Uk+7QYj8AxY6AhVnD8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=A6uudOphVfwIHGV1M9Y+fTURzZzdu6IHd2WuYguba9o=;
	b=DBws0lPHHJ/Us2E7kJ7ESMNKfaOzSuiVKqKKLqEe4ekBPYojsg2Lpg1CGwRxY/6i94o4
	 A4NeAZGdiL9PcqKP9SeOWeIZr0T1NpVixmRhQcHEvtOORG0YbG7jNecedWqDADKLWQ+rt
	 JQrDVbNYeosFx0lPW363ojZww4b7/2ihXPzekuhtEkRPELgg+8kZJjocIvk1KKP+Hl97L
	 yr4o/Oj7q0dRJNzN2v7K071EL5+f6In6Wgw8qCgwaJfxs2UALM9k9JHgtx9ql23RNIbEP
	 cqqCI5tsWxpGC3CwbbKR6zjvlmSpm3ewOM/291AnBrKewD7CV+MvYwPlYBWMhs6qltg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hgFEFtro;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CFC606A321
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 09:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65CFC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hgFEFtro
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5310799f8f.3
        for <imx@lists.linux.dev>; Fri, 27 Nov 2026 01:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795772001; x=1796376801; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6uudOphVfwIHGV1M9Y+fTURzZzdu6IHd2WuYguba9o=;
        b=hgFEFtroSR0+r0OxVGCx41CNwsxP2r6xjltu0knRxxVm1WLYlJJqfDa61QoFlRAY1K
         tTrRlDVKdPlwdUbRg+u1//hAMparF75rlysSmoRhmCzg36dLYRmEIczSQ5N72J6iGagq
         MIKS4z0s/2DRpVkOzWlYPCG7oWqZTdF+NrwRHusxKsMCgUnG+S602c/Fclinhad/q7bw
         Z5B3UXfiYsKNK2UxAb685CoX7X0s5vnAT3znHRiY3z4i7vLPNEIWfXYE+oR+a/SgjgRS
         P5DxvEM3Y8v7UlXBBqAGNFq2GB+ZPi7U2S7o1R6HtBEAaJvrxF41OV7kLFKinLKkESCs
         /ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772001; x=1796376801;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6uudOphVfwIHGV1M9Y+fTURzZzdu6IHd2WuYguba9o=;
        b=vGM4OchFSzR1Z4Bbgaqs+dXWeSTnU74H47aAeLH1kD8ndLFA+LYYCBzHDydQzc2LdG
         jP0a/zI0hqIJ6ePGBd4lSsnBZpbGjQfQb7EeRJAEbQguG3ZJMY38+iOvfWbs8vvIIvV2
         nx1ydMABqckF2+vzV+FxELHCB2fkBmHb1fBVH57+kE5EB+HmQjbZRLRrYv8hN0di4JV3
         KRAmW+YYRdC4UoHLTbFw1V2pvJ3/JV56/vlfZ32R31kwY8PZhAGL60A9SS0x1lsBBqI9
         Ixg+EvKG9IOPzNPHPmbEC5SFUcpS1kEBi48rT6guyvtBYoNKiOahOGJtDfgL++L6YlPV
         63kQ==
X-Forwarded-Encrypted: i=1; AL+hErHcnTBRAhthDtbxAt35Om3INh0Cy2rZYhgD0uJsaBVq95IyMj1P/fpnj0k4ZJwVRvY+oBM=@lists.linux.dev
X-Gm-Message-State: APuU4Z804W4VxLzZbGH2UfVtiUxM1EQ23hKRAHkR0BlqmFHkDAPpCwrq
	DL4ALamsndI8RL5pSurmslg2/mP2jzzEkI8ubgx/vDtHusmPlhYGfFRlq8GB0BLgrVM=
X-Gm-Gg: AZFdTZdY/Bc1GJ9mOFkClOb0SnwPjx8SiF9uhe1edTLLMOtPz+LNGqad5rIrWCE3muf
	g11xI2lvbf2Bm7d5rFeHooUivgtFW4BrSwKzKbG1ukAHoThmG06XefDxtnvxn/oZDQInoJgEFaP
	8Vj+T5iEcPMrji1/QmtnWc87kFPS+ML1Make26Jbd1LSBk3iNWObozmAwewJc8Bktcx9PKrpnht
	7oXnjP/N9Z8JVmYc4Yci9vVrd2NOH1Mny4sKiksR5wj9Hy/fewlL+ADzFTyE9fPXO+sWeNjgk5K
	5TWpaEOnCLyurI8WcGgZscw+IulDEvu2UhsFa4aetN7X10mfvjy79MFrIvf6nWZmD9Zt2Ro3LxN
	E8FsRFx9b1fGeyI8RFmPU3h2Wv+haU9ip4vhp8wJ/OwKVCyBUx2JBjpTPpnXgJ7fHWqDVELDuXT
	LzDa8LyBLTu6TprBWdkPyAXZVgRGQyCf8oNofdbktAl0WJjEtX3IfklEIKfb7q3WesThPBgsmG5
	NeTvROw4CMskbSn9Orti+04UmnZHSmqFjShBaDiN+QcypsZDHGlAFropy520CQm28ecx1v4roq/
	XhUq28oDYY2xmIuLaNSCChrlXsk79nSZEKd2onA=
X-Received: by 2002:a05:6000:2903:b0:4b7:70aa:4553 with SMTP id ffacd0b85a97d-4b770aa4574mr22944028f8f.38.1795772000643;
        Fri, 27 Nov 2026 01:33:20 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm46450336f8f.44.2026.11.27.01.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:33:20 -0800 (PST)
Message-ID: <41962155-e78d-46b2-a58d-45282fdf1cca@linaro.org>
Date: Fri, 27 Nov 2026 11:33:09 +0200
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
Subject: Re: [PATCH RFC 00/16] spi: spi-mem: Express the dummy phase using
 cycles when relevant
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Liang Yang <liang.yang@amlogic.com>,
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Han Xu <han.xu@nxp.com>, Conor Dooley <conor.dooley@microchip.com>,
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>,
 Yu-Chun Lin <eleanor.lin@realtek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alvin Zhou <alvinzhou@mxic.com.tw>, Cheng Ming Lin
 <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/25/26 7:51 PM, Miquel Raynal wrote:
> This is only build tested for the moment and sent as an RFC because this
> topic has raised a lot of questions, there may be things I have

There's no ambiguity that this is the right direction, change bytes with
cycles. As a matter of fact I tried this in the past as well, posted
something and then couldn't allocate time for a new revision. You may try
to search the set, if you haven't already, and check what the feedback was
at the time.

Cheers.
ta
