Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4100302144
	for <imx@lists.linux.dev>; Wed, 19 Nov 2025 17:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763573708; cv=none; b=QWz4Nqq2y9rm8Id12HUOTaBgrJgcWcSOTGv5ffHNtdhIuF+PU6g/LJSRcij9AhIrMzNKB6dzHNHPJ68j9hn204PUdlJiCLkB2mYBHM6tqgIftYsmau8icbGhMcYREeiXmx32XkPgm+mWcTnSdAFTf7sITGR6kXM9MGIpd/eJ1Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763573708; c=relaxed/simple;
	bh=dV4KKw8/UT2qsNhrMVvIgosBVHg5wVyN/kfJhJZe92Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5nRF6zNWQV6fKM4fJDhkR9+4dW9m6/ae8IP26LcgGXvgMm5+r9KcfkyTKz23Fa4vjfJ1O8WQnyuA3nwBqyEDSjiA2nyJkdIPH5VV0jaKXNKUzlKvnMv4Bf7TvZeV/XpB9FY5Ol9WomgXxFUmmQ5pV9XfrGhZhjqpRey19Fz31I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WHjH6S8E; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WHjH6S8E"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dBTBj0Z4wz9tH7;
	Wed, 19 Nov 2025 18:34:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1763573693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d7DjuaJPWcETZ1BexKkq1MHxDnEIhEMitdG38RRXcQI=;
	b=WHjH6S8ESGByKl/O/KwaDe6G2Tvvl5q3caVr6qlZuksDsp/DwOKBHTrxofXW2BEDn/tnwl
	L+9eYypQu3P4YLegrs9sdKNx280lnZ8shAJkggHxUcvPhDwsHtJKf0iqMmIxMmFHSUxwWA
	b0+ezok5Ow07/nDu3a3hMvc+1vrldol3f5pX4HWZYS86M8qSl7vHkNEgdFmwHzvwplBY0+
	HPSCvTWPfh+i05qlKHtVhzBxETEFe8datCe4BNgejZMUNWVQncD4qxBsQEp9NRSb/ydzkd
	5MThOY6Eu8CwAIVIH7DzxJbEoqPrsToqIlMKElDewFvMshUZnHTmXbEz7Keobg==
Message-ID: <c85e39b6-4e5b-4bbc-b1b6-7f910c8f06d8@mailbox.org>
Date: Wed, 19 Nov 2025 18:00:55 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: Shawn Guo <shawnguo2@yeah.net>
Cc: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, "Jiyu Yang (OSS)"
 <jiyu.yang@oss.nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Xianzhong Li <xianzhong.li@nxp.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
References: <20251102160927.45157-1-marek.vasut@mailbox.org>
 <20251102160927.45157-2-marek.vasut@mailbox.org> <aRnBqgzeotfrdNmy@dragon>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aRnBqgzeotfrdNmy@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: xfg6n8nhyrnhx6yqpdx41yjpkht33zzw
X-MBO-RS-ID: c077a67f0eb4f199681

On 11/16/25 1:20 PM, Shawn Guo wrote:
> On Sun, Nov 02, 2025 at 05:09:07PM +0100, Marek Vasut wrote:
>> The instance of the GPU populated in i.MX95 is the G310, describe this
>> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
> 
> The commit log seems need an update for the regulator part?
The patch seems to be already in next, but if it can be somehow respun, 
I can do that ?
