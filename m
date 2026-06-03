Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2E1409109
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474243; cv=none; b=cWlLwz9ERmba/rK6anm3HTFhad9eHq40gtiUfYbhM5LVir31IUZS9xwkcEwi/2+XtgG+SxCFVQA2hTRftWYkpt44iO8MoSmsG5aTBNxCqWjN+smcMHxEQdJ0CMP2QFgxP2uEfTc2Wb2smru+bi6+P/A6jnDgNWQ1s12GPf+MYO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474243; c=relaxed/simple;
	bh=L9urVhS33Do6zCalZdU3eSAmMtEgi2x00tmzzJLChU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aa5gQiQaRz6y1B6a1Q4BKJNWwqnsY8VlRgBYBCRJJgo5vgooUif9lFWsiRor8hYMdJDKdFFetiOrD1YrQj6Zd/TJyFn+Ssj7YiuCWYkEJFTOj9mE5CDmobeEk/jpcNrk2ziHcGkaNDpln1fx37KiBpnveyzg7afCg12ErecAeeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPWVwnqK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPWVwnqK"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso4391180f8f.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 01:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780474240; x=1781079040; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PzoJAMfBbn1uwW6pXQumFkyZkDU4AXI6hlryg4nLphU=;
        b=IPWVwnqKOBnYgQQM911VdsKDbgUpGaeqeX0K46A3BreGnSsbNrNi1fO51xQBBRc0Hm
         Ipndd1cBuk4t9MyU2sTDa7zHUVLic+5KsS3+XQ5vXavP565k2t0npgKQcRvtghVC+VCV
         zeCukh4vCSHJ/E0IQudOow3MlzlApRq28XN6ixyDasz39c2kthH79INDkf8lnJ6nKNsb
         MXlhqpSGEuLgaCjZM07ANpwXBQJJgCIq8ukofJkJxZFo35LW7cGyMnO91D9TefUGzK8o
         cm6MWijFes9yLW3gtG/3j2ZRwyVBLM8E3ZL9iskVyTfeAm/xrd5fuv8n36DWYVoroTE7
         4dHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474240; x=1781079040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzoJAMfBbn1uwW6pXQumFkyZkDU4AXI6hlryg4nLphU=;
        b=jiKs5/3WSGcbmLJO5OCU9Tf0gLOBHLELqk+++UEGmEry22JH1lXd/QbxgAPW5+LCJr
         Y2aJKw79F+bFAwHuOKuIfWE3jo3W5y6SKMsX3JTcuVS4XttATtiB3Mjb/M+rSMsJOmuC
         Y03/T3rD7pZqjsEcJmMgWqrvIo60Wkfxelnx8v6YLI8NpS5uPEqogJPPa2Pf+cBzMLvF
         LT1MdjYCzvKqSf/1ze/P+xGEKMSmIflTa/zA4QOKMrWRlEkweaHi2pVMrpGbVBgdTDUx
         +ZaKZTRghxI0fsJlE+6rmBU5Sw/b5RWRmm10bhiaZGMWDOzbhmviHzj57SB/QAmgMLcY
         1cVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lbMV4EBUNRnglD9CIMfLgInt066EFCeWx4e1mP6SG/Rr9chuIw+boVVUqmhhcRdabRV0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyC9qAIEfjixOmrZyN8P2bdiN762AgcR2CiV3BZy1BwwgwGWrCC
	25TOB84I3bFHQzYZVYPRhvooqLq00675Fnl1zQ7iMIXOvVSj7YEcYOLt
X-Gm-Gg: Acq92OFF35+wY6chbp0//8jbeEZBx2rVFtz/oQdNNhV5tdD6ZfsohLNAZ85L/6XQTsL
	rx31go3BxMQFFv/mgVWKW2Kpoxzl0RCLddG1GQh9y9s0kBh/usLzuUDfgWDm1qSY2UrEdQeMPjp
	/AELoP10mjqLCmQEF/jLDAOC3GiuH7lgMdwmibZLeCtKClZnbapPT8P0sH5MBwtWhfONJ2z+xQU
	DaP5XUUt56zGbjHlnk1oSJ98Z5YFsZd9OF+k/ofiOuvBZha+F9PKx5D9SACqrCagX/3hcBtEoxf
	3F1vyzY+CDYzZJkAvcvVcMWqFC+0gtkEuENTJtHiAGX9xdHdEj1PEq6RugI7INz75C1MqjWWPWB
	SlVjE0+FoypUtLT1VBZW+GnaOPOzlR4LpT5lo2PZPNYLbG0lNaEXuU4xeTji21YA3Wxe0GTs+bb
	37riqgS0IlM8/PRtvjskVIwJhMkfUJG5ogmvck7bSfJZR0wSlGr5Q1dOUyQmrRLELglSwRn/8OT
	uYnCv6X9RWyn020EDGzy0CfFns1fgxNAha2dj8PUR5t7XcVOJ+rbVs=
X-Received: by 2002:a5d:457b:0:b0:441:1e8e:d8fd with SMTP id ffacd0b85a97d-4602184d442mr1812471f8f.29.1780474240292;
        Wed, 03 Jun 2026 01:10:40 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm5638407f8f.37.2026.06.03.01.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:10:39 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:10:38 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: imx93-var-som-symphony: add TPM
 support
Message-ID: <ah_hfhpujDwcGk9W@Lord-Beerus.station>
References: <cover.1780051874.git.stefano.r@variscite.com>
 <64adb6f0cf9efe107c761e1a69b9a63c7dd0141a.1780051874.git.stefano.r@variscite.com>
 <ah3wMi6QW6DUPrS4@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah3wMi6QW6DUPrS4@lizhi-Precision-Tower-5810>

On Mon, Jun 01, 2026 at 04:48:50PM -0400, Frank Li wrote:
> On Fri, May 29, 2026 at 12:52:44PM +0200, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.
> >
> > The TPM enable line is a board-level signal driven through the PCAL6408
> > GPIO expander. Keep it asserted with a GPIO hog so the TPM is enabled on
> > this board.
> >
> > The TPM binding does not provide a dedicated enable GPIO or supply
> > property, so this cannot currently be expressed as a direct TPM
> > dependency.
> 
> there are reset/reset-gpio, can you use it?
> 
> Frank
> >

Hi Frank,

you are right, reset-gpios property will do the job.

I'll send V2 soon,

Thank you,
Stefano
