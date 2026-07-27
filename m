Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4882566D3;
	Mon, 27 Jul 2026 20:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183438; cv=none; b=qEKX5R34XeuxAoyhu+zDSZGRdIKYBCE+q6HX9dl9BMr6MSJPY+e8TOx+XryIxKZkd98i6ifbTEd23biu5NGrn3LegnGuMhQ9Y/q8qJOL7x2SKpENK4n8EyokXZH3L3VQMMPQ6jJAfTZv0eXFZnuCuxQBflafuIVjS9R4H/c74ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183438; c=relaxed/simple;
	bh=HRTJfd9zZkQyG3G1nivM7uEr/3WXRcqlU6N5OA/wf/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kfw1m5FTXraco3aXmlZcG0nJwzx1UK4exqrdplXVknsb4EVmQsydkwkQnO3unz96ykm400CIY8rDfhguhQ27BmZDdpxcXw0lQ6rBWc4XJYo9Hj5PCSknAkMkcayMUCKRbYwl5L+fc0ZMqIWMfdK4fOWFeKiUdox5VZE2O+PMGoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QA3vodlO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QA3vodlO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716ED1F000E9;
	Mon, 27 Jul 2026 20:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183437;
	bh=HRTJfd9zZkQyG3G1nivM7uEr/3WXRcqlU6N5OA/wf/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QA3vodlOd74UrFO0SXkn1wkDyme+d2yn1KGHFgZgFNrpeWhdXv/zaDadmtWsvhl9R
	 Kld2SWNWghIFXbQRPjPRbOrq+vXQYHXgbMfY9Itero/OFg0LQjybGUIwtw5m6/U6+q
	 RoL+9Dr+iCBnSK1e5CPmPJk8lxJ+0fhzR0FQnmJ6IaREo8aNa30sgZoWmNQHqhu7WD
	 aLLGN79JFBrk8ErzQoeAZhk/TV9aYmuSX7KLh+elL+qbxN8gqI7VQEMn3PmBbNxvQD
	 Wt57GetEKRXtYzsiOaey/zgYfrCvm4X0Slzz2YBsQ/4m5MumY3zx0ohPuo/BC6CbSF
	 fehLsUpVON8MA==
Date: Mon, 27 Jul 2026 22:17:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, =?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/5] dt-bindings: arm: fsl: add base compatible for
 Skov i.MX8MP revC
Message-ID: <20260727-onyx-copperhead-from-venus-8824ca@quoll>
References: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de>
 <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-2-ca8a0446166a@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-2-ca8a0446166a@pengutronix.de>

On Mon, Jul 27, 2026 at 07:31:05PM +0200, Steffen Trumtrar wrote:
> Add a generic compatible for revC-based Skov boards.

We do not take generic compatibles.

Best regards,
Krzysztof

