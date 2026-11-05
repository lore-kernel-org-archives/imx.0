Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901388;
	b=1vlKZ2RjJ1ldvlk2pO+klO1gqvE4u2nE7VaIht/zKj5mIk3u/zR5nGbiAeiu0qfK2RuU
	 /kQCsPAEXZCqo2Fsuzq/fAHpqIbfrwKHJs+VwZA3BgHlGBcERw+OrYsGdcreMKd0VjsLK
	 fbigMimij6gkjQDR95hAKIUubLa5QB05Sfpta96xQ5+I3wxebKmrweJWoe8ewU4FzqDf+
	 NYq1vp4IaYSYWptWEgB44YYrFdxubZNf31T9+0qHR5kicIx6ofxyelLfj4OtOqXnZrpGj
	 SIbqI1VMFVBxj1ZAci2Qday2ITm31e638tsTs3Gwfhb+vz14F0dnSgIKj/l+MV4poRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GcH6tkHTL24evFghlRPkmxW8tDFnCzFpfv744zRs954=;
	b=ijIoSfUrFYkQ8acirfSb8AsBmF6DgQIAiUywIVzVVSUkNnp36//twF5rdz7VyRb74WRw
	 o2EmXZSkQK8sZNM2qfq7kdZiUpstjtumGmHv7KEpkYSolpzoezxNF1RpUn5DXTy/ESKbs
	 lbsgxBY0E6HiNPpcZftNhVbSWvI8wEsrMfXsxvaGfGZJTn/oasebT/60ZSyOoZiH0ysV/
	 4ZheQ8H7OiMDhwcy9TG8fKjUQszxCEnPVYrbFm2eIw4mz+KQH/DIltRvAEOm50Mc10hQZ
	 hJl3x9nnRtK8dupPVTsu5cb/ndakvvZl1apuDx8Bc0isQUIEFiZMWYLSHg6Hfy0XO5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rq9HQghT;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCC8606A32E
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 17:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCCC8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rq9HQghT
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d05d51553so14439835e9.2
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 09:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793901386; x=1794506186; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcH6tkHTL24evFghlRPkmxW8tDFnCzFpfv744zRs954=;
        b=rq9HQghT1/QUFOA1vu8/zGKcOIyoHSFCOPXiqNxzS3elEZ5mlYvmu9wdFGSjWH53Y1
         J1KiGT/x6saYyciyayOvLM28/wLiyGUBASZ+JRDB+Iyj7b2uIbvPmjt36FHmDsKKa+IF
         tstSKqSUNeWZV4EUCWpPWBcsjpPy4/Khhby6IFFdxYdPnbR/C7dq5FFmL1PmN0x4rdID
         PegZDcr37XWdGiQts0BTHZxH4ogjSulrj+rISJBcB/aoqEtfVEUqsnewsdk9YlD44axc
         jgwozRDPfkIKWD2u5a71wCd03D0kiuYU9FACl4o2XdXXJglco7FEm5ybAQhG1vVkyCkX
         Q28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901386; x=1794506186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcH6tkHTL24evFghlRPkmxW8tDFnCzFpfv744zRs954=;
        b=KNfk36ab+bWxSK6NNMI7DplZI1DmJcv/T3Hqo4Mz8iCvBGoj4FHGENP8Drd6AaEkBF
         oWqhEwD17sNx3uLbarHL3rRfA6gMICV4SC7cirbFdujzSiBh4Pk2a2t5PrxZhekxgYSi
         76Gx7ASgjGlxpPMsC9/wwgbNPv7/9KkJI0H6lknF65l4aSb3FPWMlI2hwW7DE+ZwrT2n
         BT/A0iiDn6BnL+YTNwZ6XIh3ndSXHzGxZLdOmZCsmlvUewupVg6j0CjVWDbY5YPssJZC
         LaFHNaYz81lXILkWtxb/vT5achIegi2sovhWNTUVNmlqfErtYSSaiGP6QmuFYZxSfssd
         J0xA==
X-Forwarded-Encrypted: i=1; AKwUvBxxjZTOHCHeYLCdW4CzzoQo1PtZM5OVxINzZm0Scfy3Ph+u5Q1f91fXHQpZFiDoo/v/+Co=@lists.linux.dev
X-Gm-Message-State: APuU4Z+b2jqsPUuBHZar9FLlPMDegqvKQVhbyVdXktZMRf/TlXjY1Ywn
	S+UOhhmYf/dtBUjj+mTgGz6hfm7nYCmWsohclzvjf1me5MHnpldYWgaq
X-Gm-Gg: AYBFou1xmEYIp0sgiK+fJcvkV03i6Bnz3QnrP47Qzn59iMWaxQ3QPmncoqCO89wBknY
	iuUKyqbkYbnuPPylEuTP8DF5CmryAXYx9dF4oD1wVUt9xQeKbtD81mcO6IItW6BhjftiToDTfQt
	br8/GX7NHKIlLg2E00cnjN15LMa1Z+PWF687p0Hfr+PP+lwt0cnssjtZwfDZQ8wg1H/JE2Muffq
	JLNIBFpBOg8Mi8eWvTYNbGUJQuziPZl1kFF3y7FEtOJY17Qh2INkzZ4QP0dkPS7I3Kem1M7L52I
	VfVO1z876TTV6iiqXcx+5pdEChhe2skoDZsocsdERJ7/6KdmIJsfc3vyF1CUXHAibepxBjPha3T
	cx14Dm9pkUX9oXl4jTD0ODJOj9Pq9x6ag61rk4msPPzCcFOWYOVbP3O1ruHwwAM7uSqaTJeIYIK
	akAx9gImGIcspJ0LJpXLFN4zvQzAaULn011j6LvUCkrBmXgROEkC2iZTs2xvBTfXI59tt4PyY1c
	rSMIvGN7fY7JdgGrEucahKHV/DghayFM1Y42EgqBkPGtxR5GDR0104kS/eKEHMtPpljS6C9pN3T
	TqHw6y180h1gbOf4JPYzRM0hgy0s3DtR7lLqKoH3CgIWMB7nq6ZEK7qvx5P/RNcMBBIy56UVsE7
	qgfRa6IseLFSU4qcZWjqxoBMMZP0ynqSxTMRLlIob8MTLhmtNqD86RPO5p40d6Td9eSAdH/CdkE
	f2r2vv
X-Received: by 2002:a05:600c:540f:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4ac17d1a1f1mr456154495e9.20.1793901386029;
        Thu, 05 Nov 2026 09:56:26 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcb8sm77678635e9.1.2026.11.05.09.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:56:25 -0800 (PST)
Date: Thu, 5 Nov 2026 18:56:23 +0100
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
Message-ID: <auzDR5B5k5GR9SRc@Lord-Beerus.station>
References: <20261105101739.10614-1-stefano.r@variscite.com>
 <auy-OW_td7N8oHK_@SMW015318>
 <auzAh7404GAsY-U0@Lord-Beerus.station>
 <auzCs1MXC8gWXtu8@SMW015318>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auzCs1MXC8gWXtu8@SMW015318>

On Thu, Nov 05, 2026 at 11:53:55AM -0600, Frank Li wrote:
> 
> If not impact for current user, needn't fix tags to back port it.
> 
> Frank
> 

Understood. Would you prefer a v2 without the Fixes tags, or can you drop
them when applying the patch?

Best Regards,
Stefano
