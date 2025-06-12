Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6333229C34E
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 18:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749754251; cv=none; b=U8ir8VBvTh8U6CZX2gyCpH2b7390zfKwUJbFSiGLFPXICFkaHf7RhDNgIivoBYwozF/UJwJjs+aWkp1opmV0GCMdnuHrUL3nFtEPTEItnvV9/e5qu/5a5DCyYFsmj/F/h4xcsW5rBCfpNB/P0SxYd41i9cvWO+PeHyIQTq33Elg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749754251; c=relaxed/simple;
	bh=m7RmatOFZf37KbJP7V43/R/yV8MVhhr9v6tiEmktbF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WeZbQLlbtmMQ88//h0FcQMSBHNJQ6qbemmZLd3xV2onzZ+PQ89vGWVk84tZ+AD07HPnspMMxBJb/x3kAv8GOI609LOdBRVYbp7txXCEavCuB3xtoN3VSF6Huo6+pCocefOSh7onYwo7TvEJ8Dl4PsPLrmgLCX3ANNTC1WbGCYP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KnC71Vb2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KnC71Vb2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d54214adso11268765e9.3
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 11:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749754248; x=1750359048; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8tbSeZMHtNCZXJWreRbrqTxYE7/dISAs2k09LBmNzrM=;
        b=KnC71Vb2OCN8KNzqF7w2czLvNwrqpNyX5gufP+Nmd+zfHZGULDxuzs2HiKAjjbvS2p
         32eff54CRbqLX1vmZ6S771sYImYLRTPJBEyz8znqCvAJi5JZntTXmtMixmlHgyOLZAv6
         VVJvViOfKHqx4PpkNuZ4GF48egHOv6/l2/2dZRi+olQkvbxcsqIPP2UL+fGWE2CbfdT3
         h1//F7eF9w10h8c5MEcT7a2QP/KlUkVGQxm5FQOk6/cJcLEXT7ccdrNu7+oT/hLvRua6
         t86SfzshLkXHUc25GXAXVUSJV5z6nvlwMjiMhB8SLtfl1um5Z4ISkf3zXEhGkt3jlx7J
         tAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754248; x=1750359048;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tbSeZMHtNCZXJWreRbrqTxYE7/dISAs2k09LBmNzrM=;
        b=D3cThvR6lt926HJnfzEs0PwnnAdJT4CTf/XXJ65v+EPMlniXiSoPv7ZkLh36go3lYZ
         yYWExi7F9XcIUq88sJjIULtlqvvfwbO7D3vho00E5OXcWNOs5vGz5/LNYkfGNldIpE4l
         jGpqN0sP3SW1LN/2xPJpSkuf9IwX6dgJvOO2UX91uBlQCx9LqhuSMvhEQW0MrWhVcl5E
         q2DSEBbNZBalrJzjbJOhE42io2AaURDVygNEla8If9ptI46jC6kYpv2jEQYjqm0gZMFz
         0BaHp08TebV9GMIHEG3PoHShIeB/7VhpMO96l5qieB4Fc4/qmnney6bDk5T7LjmXGjJH
         IjMA==
X-Forwarded-Encrypted: i=1; AJvYcCWfi8DNtY0XCx7w6JTlHpwORtbbDDwjSyF6YUbtdaANbqqPiHU0JiEvIiFWil7ckA42TJM=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt3FbX4OX+5JORoEoF34T7ZGaZi4lk0SbmZ+DoJ/8sfcSVWSW9
	3lM0J/57cQn1K+zatP7LwLBiw7+guL4ClEAwZ+9tObVIj/uBUVM3xP+Ltgqv9unYLdE=
X-Gm-Gg: ASbGncv7pmms4sHwTFq1io1nF4QA1FH4JsyZEVmjIq9T2oGmrBTzEmHIcXm414V5qis
	/st655+RHO691DcBEmqF1CU75sAKbvc80TUFQbeY6suCMP/hmvaWRxhHS6+zsHu8zKW+2MDkE6S
	qlYmtepbi9+mB31MCWJymQZJGLNfluNgLkXMqtwLZTdYgdRdHSAtkWOmqAlEi+zod+VtSBlKmmF
	37U7dcE0NFXsjVPq6sKH0F0FQC/EDznL1Bs+rbhvRMpqo3rUKeAjhVUGEe4hHBWI0o86H13iPSm
	tlZLrieuAtDAnaK5iyCqPva5S2UW4pB6RF4UlRAH4gLFGlr5/B3wh7Zg4dOj+gVYi68=
X-Google-Smtp-Source: AGHT+IFFK9l+yfY1kr4NnMO37BPPvCq/YrWFhg/vLvoWZsXd9u+zkfYJb5d1B0c7bwKtakecyoBgfg==
X-Received: by 2002:a05:600c:1d22:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-45334b0246emr2257445e9.10.1749754247699;
        Thu, 12 Jun 2025 11:50:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4532e253f64sm28578855e9.27.2025.06.12.11.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:50:47 -0700 (PDT)
Date: Thu, 12 Jun 2025 21:50:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	s32@nxp.com, linaro-s32@linaro.org,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH 0/3 v2] usb: chipidea: Add support for s32g2 and s32g3
Message-ID: <cover.1749747898.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset adds support for the s32g2 and s32g3 chips.

The changes since v1:
* Put the device tree lines in alphabetical order.
* Add imx@lists.linux.dev to the CC list.
* Use power_lost_check() instead of creating a new REINIT_DURING_RESUME
  flag.
* Change the Copyright date.
* Leave the .compatible = "nxp,s32g3-usb" out of the ci_hdrc_imx.c
  driver because people can just specify both in the devicetree
  since they are compatible.

Ghennadi Procopciuc (3):
  dt-bindings: usb: Add compatible strings for s32g2/s32g3
  usb: chipidea: s32g: Add usb support for s32g2
  usb: chipidea: s32g: Add usb support for s32g3

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  2 +
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  |  2 +
 drivers/usb/chipidea/ci_hdrc_imx.c            |  6 ++
 drivers/usb/chipidea/usbmisc_imx.c            | 89 +++++++++++++++++++
 4 files changed, 99 insertions(+)

-- 
2.47.2

