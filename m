Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A892EF67D
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555395; cv=none; b=tcm0u39CqsrfP++SPstoJt4TP2HAJZIEZIAQ0e20d1j4KC2f4nvnwAkuOUUsk9iQv0YHYLN491d4Ma18Ue01PEY8UhgMASxw5CrJrW6Ai/Ly3ZBOAj8R5JZzFmzy4X/4AEJK6mKq7HHSyKAXFqZWRjEp6niK4PM3dBJMyoWf+BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555395; c=relaxed/simple;
	bh=Wsw3m3WVgS2qsRwThMHxPLJn/WaYhLMQQfJFrjeEZQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXONxgyWrJlsq1pBIEEIe7iWZCsg7yOEGvkxWxZTmIGif+8bOtDL4n1cU3uJksKqYZvQPeUs7NdAcEl7dT9mdCx9wn8L1/zSr/GxXrffpYv0CsgV4RLt/QTrLkbtcCUULrky+zmzspEplEmRXCPh5oZtmkx8BsG3QXO66dttgM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U61e0xwr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U61e0xwr"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a52874d593so4817692f8f.0
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555391; x=1752160191; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N4xswAcOCiDxtwue83ObsxfZ7pep/Cfzt8s7Ua/cbyI=;
        b=U61e0xwr/IiJagMS+mWEfmwLbnzrQy31Sa2MG4VdOXd3Yfpg2JvvzbWygSNPh1fXFu
         2kt/dM6jHWJvCUZUj6LagTdWR3EsB4uQ99kH0GgOktxZ+9Nr6W2wxNkGLxgsrqATzwQk
         JkDWVrp6/XvOib2aGVlW1szXtfVCDsEMnh6bb5teSgvnpCLufoQCXh3FZzHaudyA+Hwd
         qycKr5hd6sULT5SkUt2pUPVDay+Rl8bQWejObHXCL8kHjOfK36VSgjYIgHbBpHGWHL6q
         tyD7NJyWaIc1JchnLiDZZJsg8gvss9qWOMM/4APB2bCL6cuXAKf8RgRTBhyi8X2IrF7p
         F0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555391; x=1752160191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4xswAcOCiDxtwue83ObsxfZ7pep/Cfzt8s7Ua/cbyI=;
        b=ht/OEl79J7W37MIyInCK07R4TMb/vX/wib/eYbvh6kjcpagnULgx2kwl5eakWo7m4+
         M0egGizDSQWJHsulx1JhXVL4l0wxxM8NHPQuNs7xofxYRd0V0ejJKkq/hczIn3wYlt4H
         pbD2qTOxBTpk/FSUy4CpmPsOKDjcomhO2PyVP5MiIbCEtBYYsE9Kz+OCbbudur583F9P
         y+sRT7nYCdxWV+6UE3qKB1nL7mBq2KNCaz5anEcQNupVTv401YJsXnVkZaxdIorBMLp0
         vwuKmcpgSbfHddb2YxslQ38ANT6TG31ZSTpNp86UZmWPV2cEV084J3O9EgNmrlj9lW8/
         euVA==
X-Forwarded-Encrypted: i=1; AJvYcCXnscrZbG0TkRHukT5+feCyK7wh25HmCDK3qRIKyR1n/jy+H9xJ+WleKh1ZF2CNDO1y3xw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9IJUDfr6BGjhvSpvjGEH/D9bYtXlVDsvF03GZ4C7sPNV6eOij
	HxvvGZE7WrQtmCR1qZjPLFF1cDKBV2tne6N25j94QcwcX1hYXswbjOGiEm1Fw39rG6Q=
X-Gm-Gg: ASbGncsWueNvhw1ZoG6dqsBsgXN9Oy4IG2457dOuE2ob1gqFzY3bFKnvGkE3PBmRl+1
	4dojcRm8ECTLA7stmxCpkH1byQLVofEZ2wiLKg2XIMwnbeKEpzrTH/CTiyXK00/f5Mpwt8vUwdP
	virqiw8xgI+nwVFrBp4okUVVSTsqW8354gP7UKbq0Op8IRDPIYlq8FooXpGqiuE2pBI75vW41pk
	1J+9Iy3ZL0+CkH0PzgNBY1Qi95nhZFv/X6S304Sw7w6GhfQapB9UOOMJuvZ0Rr66S2ViNiIdQTi
	HmW0bFV4aMiP9rISoZJ3VDr4PdPPoLUYEGAXMm9NfLmEvL0Ux8rGyeIgSxc=
X-Google-Smtp-Source: AGHT+IEmRzbd+GUqMa9EtpxZkxLu0N77USju2BDfKfk5a8aVAGwl1ML9f6DqwUQeD0xjX4cStIATAQ==
X-Received: by 2002:a05:6000:23c9:b0:3a4:e7d3:bd9c with SMTP id ffacd0b85a97d-3b32bbd66bfmr2181064f8f.17.1751555391014;
        Thu, 03 Jul 2025 08:09:51 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290d670sm10712164a12.30.2025.07.03.08.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:09:50 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:09:47 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes
Message-ID: <aGadO/7e4ndjK2Wg@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-5-b378ad796330@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-5-b378ad796330@nxp.com>

On 25-07-03 11:40:24, Peng Fan wrote:
> Add nodes for LVDS/DISPLAY CSR.
> 
> Add clock-ldb-pll-div7 node which is used for clock source of DISPLAY CSR.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
