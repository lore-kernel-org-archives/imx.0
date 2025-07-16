Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FE028640D
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 22:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752705983; cv=none; b=L61Hj3P+vnddDgam95bv7ai9E9w4Pmr/L9sXGUw7xOHFP1qG3ix6yOfe988SBLHdCpMcd4BAiJDXt4eobW7Nsi14Z/YqifDiNkq6IJ7W7ojZJSINuyLhoTYHzDGWuCEHVWYBwK8B7hiESMIEnyfE7C8Hbdhx9czDQWiUZVuhhTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752705983; c=relaxed/simple;
	bh=egIk+/LQ4iaDf+RLDIDJAcGByEdkupEuWlBMyV1IjQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uoxFLpTAe33h35tbFOxc+wew1bhPvj48/Z/a+u19PewcWOpapS3mJd1VXUxeCylCmVkLG8y0NG/Zg91gNl1538gwY0pxx9cqIqvCtD02UcbQi5nKc/p80XEdW1Aptl84TgOSCaOXnvIVcpUqkihFiDEqp7noFVP6UGyhxYNiFGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lA/2kSgO; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lA/2kSgO"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2ea34731c5dso318910fac.0
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 15:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752705980; x=1753310780; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgJcNNaIcB7VF2rGgBtMbF7MjrWDu7+HbpybgI/inbs=;
        b=lA/2kSgOjLJ6Dm2fMweJEo1nwf5InVhZyre6W5DBQ9jP7MTU9OQ6jpHwzACFGchZFO
         cS+HCTZtWmcxdDxgXHWt/gB+hi7ulyX/HVN4r/Be0JLt0Hdfz+2+e+75XGiKNbu/JYAu
         nOBK18dse5UfOV0Se8oLJLzwHPiYZcOg4Xfu5f7e7dpU+YkRtu2RvAZ9PtsuqJ1auVQB
         RPtNqe6SoBt4wib2XEE/R65BCWQBBa2lou1s71W/L2OWhn2/0M7s8Up7R6TCl1hg97Eg
         Kc9uAfZWV47jOSj5uGNd850xjwfH5tKL4DJl4piHyv+1uG2jRJcAlWg77drBZNLJTef7
         Dw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752705980; x=1753310780;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pgJcNNaIcB7VF2rGgBtMbF7MjrWDu7+HbpybgI/inbs=;
        b=qieAFrDZSBr+K1ndPJMS8ZvVZTFJopJTwLMSxy56B5yirQ2G84tAERQzWG0sX8OfkH
         g2vipMECNIBnKSS79nd1rzDpWS3cHg3toLd3MrxaAPYQREASLG9FRmbwPoNEYSz32P4R
         NY0od9tBFhFJZJXK01/bMd6eDOFhvvyRWW6rZcR0ayDLuIVIccF7CR3A1DOiS2hz8xlV
         SQyUaauOX5BqDV/NkSZ2LzEb7WQrvUQvAEdKp5gWVlwsOGCPLRd70b2RxhUb9RT9+16g
         tfp/9OYSClVh4+/Ed6NtMiC90c1s5RPy0trs2t/M3p4WQXsKrOCnOeYil0hZCJ0rl6Ko
         VMig==
X-Forwarded-Encrypted: i=1; AJvYcCVjnG9b58c4zc7BzpKv0O1Wth6uytIo+gItgESamJdJicF0FNTNKc8EaDcKCvNvpE4oWjo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGo6ICyQOsFXtpUF/aAm+7fwI/UEROiaYiShfA+M3fEx//ZpWo
	lqQp7MM9VDfttg6wHnbe9AmqLM0FbNeZJfhvCrHEaBaahmsfYFlfCqMpnDfii4h+lxY=
X-Gm-Gg: ASbGncurnfBXE665/EQrthsMHMKh08wICcVgkwE4OeN8gNBpKr6wxVVhZtlUVJ25n1x
	1ugyaNlUmfIvZlxSNjcpAirYe2w4ZGRxGjpuiTQ/niXweCHfxpyALNw59aP3Sr5FhHP1ywG+ftI
	I8nAQ4CLj0XZ+7bHKpeEeVfkyXdA3LZbkiM3/wYin0ZySIPChAp7yvQ+JByT8CngLKIfoLM1ASX
	TQGV4z3vvKWgO6cFKdrQBLLwlhXgipc5VjMJTE/Or+gzo0voZuXGVDSdYnnoBcEKqyJ2lH9RyUR
	Azga7MZtbZrfVEGVsPx7PzGgrSYuTOn4TfCPT9GII2soYBCJ9hMDshve7PQ0giBLHq77/2djvux
	Ltg3b7/2nmPYveEp0IU9NqWbHyi8PzQ==
X-Google-Smtp-Source: AGHT+IHhOFmUmhBidSkZlxAn7V6wq2jgbTir2wDMQeNvWS4TRSC8XLkdd89dV6UDIvXMlv0ZdC5Okw==
X-Received: by 2002:a05:6870:5b9e:b0:2e9:9e9:d94b with SMTP id 586e51a60fabf-2ffb257d356mr3201213fac.39.1752705980494;
        Wed, 16 Jul 2025 15:46:20 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff116dd664sm3898775fac.42.2025.07.16.15.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 15:46:19 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:46:17 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 0/3] usb: chipidea: imx: Fix style issues
Message-ID: <a5f4c53e-98a2-4eb0-9f30-55313be27f86@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Xu Yang pointed these style issues.  Sorry for the delay on this.  I was
out of office last week.

Dan Carpenter (3):
  usb: chipidea: imx: Add a missing blank line
  arm64: dts: s32g3: Fix whitespace issue in device tree
  arm64: dts: s32g2: Re-order usbmisc device tree section

 arch/arm64/boot/dts/freescale/s32g2.dtsi |  2 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 32 ++++++++++++------------
 drivers/usb/chipidea/usbmisc_imx.c       |  1 +
 3 files changed, 18 insertions(+), 17 deletions(-)

-- 
2.47.2

