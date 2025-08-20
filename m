Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F15198E91
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 03:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755659974; cv=none; b=fATmR0w6zt5Yu1dVHFVJ81uWGIxu7Ye7n9lYWjGvSPvkOMvoqpFm8g4KFRnmRUofMQX0xaVcyIKXp2gJIQmmnP+UjR41R+n3FtmCKu9LuW/u1o0KgszMMsmxMffCeMZbU2pZ5bOO9Se7D3OmN4RNnu05ffwLf7Qayfe5lC88FiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755659974; c=relaxed/simple;
	bh=SuvMZPXVoAnqidhK37kJ3/oPrLPh3Axcg+AGIQaJlBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLMUESmGA9m05PJp8bRDsR6qFjheGyuJSQMC2CktvNbf/B01VzhKzokeAXlTEzb8CgNDFl9ps82M6BffQ7FJfo4UsDya8D1Goy5ie6ExThmTeEVnZjfwdTxF31AFah/7T69J9VkJhg0l/3j37NObzW4BylI7C7M/A6u+jJM0CNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=pOPwXL3E; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="pOPwXL3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Yc5lcecJxiwtEE0Af0MunMTBMcGQkaxRIJrARkZNSok=;
	b=pOPwXL3EiV0xsVgk5GMwiUrF18UOtPsIYMTTDufGQvrwpO+ImuAYaoHQs60lhN
	cZ4I6h/ejWc7/EDsrOzfzZAwbyfx5BE1//FyVL/t46DpS72v9+/WDM4lnAFuvKFQ
	PDCfPzNtq21PYS/4PSJLJs1tIgukvOMiVEU4p1np/B1So=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3t9tDN6VoS0n+Ag--.60563S3;
	Wed, 20 Aug 2025 10:47:33 +0800 (CST)
Date: Wed, 20 Aug 2025 10:47:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Mark Brown <broonie@kernel.org>,
	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <aKU3Q69B_MFswwZX@dragon>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
 <aHDNmVE23O4V4rqJ@dragon>
 <69f6a044-be90-490f-b0ad-e7867a4825da@gmail.com>
 <59b874bf-e23b-40c4-b095-016fe6b14ed6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59b874bf-e23b-40c4-b095-016fe6b14ed6@sirena.org.uk>
X-CM-TRANSID:Mc8vCgD3t9tDN6VoS0n+Ag--.60563S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw47Zw47tw4UtFWrtrWxCrg_yoWxZFg_Xr
	WjqrZF9rn8XrsxGF4fZF45tFy7KFW8Z3s5urWrXr1UZ3yYqF93JFZagFZ3Xw1xJrWIkFsI
	9as8G343tr4IvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjgyCJUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQVix2ilN0Uc-gAA3c

On Fri, Aug 01, 2025 at 01:55:47PM +0100, Mark Brown wrote:
> On Fri, Aug 01, 2025 at 03:36:01PM +0300, Laurentiu Mihalcea wrote:
> 
> > How should we proceed with this? The fix for the issue reported by Alexander
> > Stein was already picked up by Shawn via [1]. We also have [2], which is meant
> > to fix the Verdin issues pointed out by Mark. However, I'm still unsure about the
> > EVK issues reported by Mark, which I was not able to reproduce on my local setup.
> 
> FWIW the EVK issues are still present in -next.

It sounds like that EVK issue is a separate one and has nothing to do
with this patch set.

Laurentiu,

I suggest you resend the dropped patches with defconfig fix in a
new series.

Shawn

