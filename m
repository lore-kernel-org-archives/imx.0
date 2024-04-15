Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF32C84A48
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185708; cv=none; b=kZ8Bb4tVHnIHrckSsWj/TDNxBS0tOsvySU2EW8kC0VIXgSIx8DGN0VSxlGZFI36oIDCBwzn3lijjDXuMxuhaUUM0djLMu9lsXMcKIpq2n5iPDRA97G0xMwzTSYZmngNsMdG5lyyyEyd/EdrwOM7VTPx0xexaBwjWEtQMjNPeS7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185708; c=relaxed/simple;
	bh=+bjzkMqcIFpcw2i9w83bp473RPBZ0vObyEaxzWVYmiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GX1/bKCJ62TIntNR8q0p0Y8hCWqUu/BYy1iH8erxzOI1ub3+Y89l4zVO/Obm6B6RMxUznqexFMgj1wdDoehh79j5zK5rRpzsopwO1mWsTjGHw48W5viuY8ukaPgTy7m8fMOdl4hG/2uqSCMGudA4Y6chhLekBoJChchQk7JLVU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y9f5ggDy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y9f5ggDy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4187481e384so3113765e9.0
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 05:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185705; x=1713790505; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+bjzkMqcIFpcw2i9w83bp473RPBZ0vObyEaxzWVYmiQ=;
        b=Y9f5ggDyvmqDheiU4glM/Iwuda6NQW2fjKYueUWzUIj2bRMhWylRAj+QBAIgzvS/oz
         6xUQ50aH6AprYZ9SbohOT8YWsM/DMgOxnpAw+xDsVxTIk8qDxGeSQxK1qdVJqbP1cBVf
         d52EzgUprYAamcTXJjdNFDuSaFi+DhWqFCsPbqTO2xwmlHTM25phGPRIirpuOXfPrGPP
         Q2I/ujj0yOhYQEiejIIPG9y8MYXT19P+fdXHBtCqJc25b3FyUl3dXSzuk+TfWsjPfcX7
         JbzgKIET+DcVllRGCMg+3I4PmzKA+7MzoDLng4ymK8+VEzXpjbmQrwjX5yBIMlHRhGW2
         mNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185705; x=1713790505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bjzkMqcIFpcw2i9w83bp473RPBZ0vObyEaxzWVYmiQ=;
        b=Sf4mc+UoYbQpxVtaI7RDASIYX7Lui72aKVmc0dPV9WD4W5bDgDlxwZmu1rM95bWwcg
         OBvdHTtUaR3Vp0ecekI23J+wSeq27dnByuAaBxag5wJEfhP31niO5edw2vusUs3ABW7c
         GgyWHNwHHKdgt/VL+wHop4PNFWAMjTZD1qpDK7ghvHUnUXBVYwa1mBN1FSI1dJgpXQAl
         m/cdRNTDkfFkXc8trHQEFJfHFDJ4T9m80S64JecfEIy8N5hF3cmWCv/WhPix7MyeviKJ
         hQ9HNGdyErwx9vYI4DXqTZpakzWZIe3fq2TTemu1o3Pm3q7nsjWC9BDJw0rCSqNOP9RD
         KSeg==
X-Forwarded-Encrypted: i=1; AJvYcCUsyknN8pntIN3N7M0PGeP8Ph8wu4cKn4EF7lcDEcU0AYodBc8pqnWoWkxkvJXMQtO/8SHg73gLC5POH2y8/3YYscHH
X-Gm-Message-State: AOJu0Yx6wFlXoxnftjLtpC6w1WXs+hRSnqSq1Qi8Oh4HLLsjWPnaZEIa
	EV5WmXA0beZ7c6KOtlPIs0E3OqNcgCUwhagq3iP2tKTlyzsBnwqufIYixDpJU4c=
X-Google-Smtp-Source: AGHT+IGHxu6Q4avREKIopyDMuH0F/FlZ8s8HVBOhkgD8sUoGIYcp5Z+UXW61HEvkoXH2alvv3fo09w==
X-Received: by 2002:a05:600c:19c8:b0:414:d95:cc47 with SMTP id u8-20020a05600c19c800b004140d95cc47mr9336810wmq.30.1713185705260;
        Mon, 15 Apr 2024 05:55:05 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b004163ee3922csm19404762wms.38.2024.04.15.05.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:55:04 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:55:03 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Alexander Shiyan <shc_work@mail.ru>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 13/18] backlight: platform_lcd: Constify lcd_ops
Message-ID: <20240415125503.GM222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-13-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-13-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:11PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
