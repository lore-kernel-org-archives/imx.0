Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E16171645
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 16:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712335714; cv=none; b=AtzuDvldPNbpmgUgAr4C83CQci6PqYzyBJuRrLDSt17WucVjnHRWCEiAdR7qiGR56sU9wmup2X3iljpJAlvq87F/tPbCxVHW1Y69S9nL9zupE424LeXMPIrgDfou57QU8yygeiqbL4NdG2S9mL0TtSentAvN8LbmdruBCG4oPnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712335714; c=relaxed/simple;
	bh=Xv13cyEjvsg2QGk7Fwb3W82vEV7OTPf7ypIZZmWM9YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQtoXcHTRAQnYWszKKeG1eJwtnjUpJC5aZ1f8KhYCw32N1iIVF/rD6P1xB/axlH8Qz1fI3SKUwfXzScs/yJqUQnkBq/FV78mREYwWtYnoiAI3wKNwGPPrgw0nvUo7+oRBqhxEG674sa+LUDcogYSPxQA2q/YEchF8F4uCEJ/UAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=defkolX2; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="defkolX2"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B1C881F8F7;
	Fri,  5 Apr 2024 18:48:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1712335709;
	bh=il2qU58UHLxy6P7NB6cyRdQntf0V6syrYQfTTjcncvM=; h=From:To:Subject;
	b=defkolX2cYoGUSNbL402FLL8MAq6f0gyqjQoL8xtSWq12xb+U33fq+ye+MqZBrc8w
	 jyVjxSGwtUA3oZAVhKe5k8iO+G6c+iQlAFC4iIcjV16PHiXNYJ0L6iZRzedewHMhZd
	 OKW8TnethTpEqNDOYqNgUCx34SA8xHkGZXOjerypmFoGCUYkX7xxyEQ0ITuxlMLnhQ
	 CHvim4ftTfE+3V1rKHXOkneQyRgyeywQqh3IlRrSTXkznKxEZPTLcXEUrDwndD9Rp0
	 VFEGuajX4H8xuUqPVisP+Msh2WfBcN5zYX9C/hf1DEShREbul4EnKi+Ai3FJXeuhyL
	 euaDJNzNKcxrw==
Date: Fri, 5 Apr 2024 18:48:27 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 4/4] arm64: dts: freescale: imx8mm-verdin-dahlia:
 support sleep-moci
Message-ID: <20240405164827.GD5994@francesco-nb>
References: <20240405160720.5977-1-eichest@gmail.com>
 <20240405160720.5977-5-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405160720.5977-5-eichest@gmail.com>

On Fri, Apr 05, 2024 at 06:07:20PM +0200, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Previously, we had the sleep-moci pin set to always on. However, the
> Dahlia carrier board supports disabling the sleep-moci when the system
> is suspended to power down peripherals that support it. This reduces
> overall power consumption. This commit adds support for this feature by
> disabling the reg_force_sleep_moci regulator and adding two new
> regulators for the USB hub and PCIe that can be turned off when the
> system is suspended.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

