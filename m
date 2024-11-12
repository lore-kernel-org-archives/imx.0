Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA822076BB
	for <imx@lists.linux.dev>; Tue, 12 Nov 2024 17:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731431058; cv=none; b=BKSydHbYHGo9p/idFKLdx2+IIXjQhH3x4gQ9KX0NERewjj5UCEvr77tZhL/cKIpIHL5C0ojdnKo6hwHmEVXr8M4rrESc4LhST+zF5qLAMuvkTyDiGuKugDP2X6kXTuHeHjAaWL7yTICZWQVcLfRNhq9isy0abnxId3iorNS6i50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731431058; c=relaxed/simple;
	bh=oCR1TRwTXEy0FAzrzB6QX1TyFzAg4HkdrRdVtwlaD0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVKeyGMpCR26DgCnHywYpTd8SZ8e9xOxs5zW1rwspOVxBR/jUz4KBwRqcnqs5ArahHR8MDLMVWDLfysa+u+O4xv4PJvTzle+uIaGk7bQ4cHiM8g/1CIAnh3x7c8FDchbPfHlVFo+192KehXmvdv17kXIqNFwLOx1j8cNnaJ0Pdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cybPPnuk; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cybPPnuk"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20ca1b6a80aso64479765ad.2
        for <imx@lists.linux.dev>; Tue, 12 Nov 2024 09:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731431057; x=1732035857; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TzAZ2wI/SsBv8e6rWIulIn9M+uufamHvYe7/o5Pmqo=;
        b=cybPPnukohdFo01diU0WdUnLwXfdl60HhXoNbM/iloWcQeQzeBaTH9CsASW+GidDk+
         fkRx2wYN8nshrwI7YLQXts8Iur1n+uWQQpGZrNGirpN0W+k7Y97nJHExmh4qzN4hE3xR
         ZYVr9+hBdGSoas0OESNS8H0if1PcgRnN/56/8Ai2pmTBRbaqhUR6zBV5qYcNa5OLluqm
         1XrHJ7OIc7pb3sYRMt/kGQePzn4GFCn/OxUGO1qyg4h9jx0Yt1j/5a/ha0iBLbrzzLbt
         DWMPjD4Q7NirV/FhD0QftTlqfEkcmpv9NcxgNJZ+ILuLSjOtHR8si9lI2tcGWsYGzPCY
         JSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731431057; x=1732035857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TzAZ2wI/SsBv8e6rWIulIn9M+uufamHvYe7/o5Pmqo=;
        b=VO/wuw/KZbEGtQWVnYOysla62XGxsWWmLZlHsOwCZr+BzKbZSKXQuV1t1aV23hUtiH
         lFs+p+0X8/b4vifMDNpcgxy9or5nNEUD2c2/F8hbJvYaAhBBl3D4En3dobqnH/Yzpgs2
         l/NPrPo2d62J0BW+DUSQsDl+MXZZ01ytem1pBXeBalHNKXceHdUayodgXw8zAoE82khv
         dGQsNieak25wYZBIaRZfS1O4ClA80fWNNKyU3GP4LcEtydpg1aF4odBvLIMRZdFJuTfE
         JKnkldQLRQCi23BtHY03qdK5dzTFUzokW0IIUgO823xLxPMNLUyYhnzaQX3aRAUaMC2N
         uBeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzVGN5M5ACBqDzVflapeZkvVKfnKhPdwXLmjImrJCSivevJiQ26UL8FRd9/yNjL455KF8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBCO6nSuLJIhwZcluDFj0aXDBOYHP5F0744F47Kuvb5Q1IArcF
	9irbZfYFF5eN8W5YT572VwGF1sbLy9/ooZP41H2GcVDeTsZ8nLcz
X-Google-Smtp-Source: AGHT+IHRVCkPv69Giv9Ck6e8LALo+6Vd8jA6G0f2rPbTFybc2LxVw7NcogCrIEnD2UMIGigrnmpwQg==
X-Received: by 2002:a17:902:c405:b0:205:4721:19c with SMTP id d9443c01a7336-21183d55b03mr238707535ad.37.1731431056592;
        Tue, 12 Nov 2024 09:04:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e45839sm95869765ad.143.2024.11.12.09.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 09:04:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 12 Nov 2024 09:04:14 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 1/3] hwmon: tmp108: Add helper function
 tmp108_common_probe() to prepare I3C support
Message-ID: <ec1a3a2c-e1b3-481a-aac6-e0826c570ce6@roeck-us.net>
References: <20241112-p3t1085-v4-0-a1334314b1e6@nxp.com>
 <20241112-p3t1085-v4-1-a1334314b1e6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-p3t1085-v4-1-a1334314b1e6@nxp.com>

On Tue, Nov 12, 2024 at 11:51:59AM -0500, Frank Li wrote:
> Add help function tmp108_common_probe() to pave road to support i3c for
> P3T1085(NXP) chip.
> 
> Use dev_err_probe() to simple code.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied.

Thanks,
Guenter
