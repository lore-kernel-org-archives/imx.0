Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9CE25A2C8
	for <imx@lists.linux.dev>; Sat, 11 Oct 2025 10:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760180031; cv=none; b=p9Zn8nODMqtgs4T7LI0FD8scIt8BeEBv3bqj26LI8KSE31s4RMAZKquJrm9Dyeu94o6Q4YzzX4VlCnGRb0lgdhhpyYP8/YqfmOhrj11E0VRBCs7ipj5pnXqW8U2M+FSrpZ8BZ5dHtQJbDu9WshqmBhjRA7k0qQG7bvVHQsQD31k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760180031; c=relaxed/simple;
	bh=y1b7IAbiLV52Hl+0zyTvcYHhXq6w8X1vzm7DP4fLDT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DsrpUwveAUn+5JUlXf2AefAAkOOiHYiuz237XkF3UXlj8sggy4E8eB0qEah8GLhWSFN4SUF28QRo689GIRXxISEcLcZ/BK+DszBaKOS/MjR4oVzUKWYh1PhZjBRdaVdiu11Xm59WtvQNIXnNO+xDDzH5OijeRwXELR3GfLzZdcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fve4MErz; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fve4MErz"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckL7h05P2z9tCk;
	Sat, 11 Oct 2025 12:53:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760180016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cET2HC+7vrNrLy9D4JAd65Kczd4lwCNYCnv06jKL71s=;
	b=fve4MErzyatUtq4fK/pZqeWJ0IROlfMPj0YUTLVH196Q2qB2w7aQS+J10BzZkfO23zwPsS
	WgXM+f7G7O4P6JLDn8yqeJciIKYYrSTqM4nsTwSgd4EWDoT53twVL/eO8yDHR3m8fPOs6a
	/iGLCp2/5y6MeJdtreqJGlzb+1BRw0e9KY9ak50T0heKE+vvMYz7YzP2TfgcSOMSeSA6Fu
	2+GAZFBUaxfiPrOUcVT+rc2zsJu/DC3pnxAJ2ippOLF6Voz7bl+54irST5A3YSaWBxKmLM
	qVljdkOdy8HrdAaS8bqSTm2JFsTBjnXiu6JLV8qyyO5ligdSjOkwIp5fbojbYA==
Message-ID: <ba95487c-ada7-48a4-90b7-fd99a0278f51@mailbox.org>
Date: Sat, 11 Oct 2025 12:53:29 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: linux-arm-kernel@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
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
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250925203938.169880-2-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 308735b9ca49f66d617
X-MBO-RS-META: 7yn9f7gznupwzzxdktpfnnjhbjkkresu

On 9/25/25 10:38 PM, Marek Vasut wrote:
> The instance of the GPU populated in i.MX95 is the G310, describe this
> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
Is there still anything that should be changed with this patchset, or 
can it be applied ?
