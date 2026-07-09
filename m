Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0AA406267;
	Thu,  9 Jul 2026 10:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593164; cv=none; b=KGAWKBdXGIvXjGVTpAnRL6eBNXrL3rehWrSmRG6KoSuqInoGJxrvICA34xDOkyXe+Jnq6zS55e59an7tadgigo7AUpx7Li0gsYskc8BCsDPWk4uYuuxA78a17XTeKKfKkguV3W2vjOa3MeMCT5H/XcjAoERjr3JF55VMAbpyuCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593164; c=relaxed/simple;
	bh=cB9ohpukroUgok4mqguDMjNC4wywPZEtebFHigsj1GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3GgfFF0GRIJpYUUho2f8eYVGl74HO84vUkaSda2fGXqnRKw3cJZUZ+QmAlNjmuM/azDjoIYxQibCQv1KpxiaiAKLaZfwd8nQ9gmrW01/ly5fbps/MIRjtLoSbp0tGHb9wsDeJbTwUa/c6zSU+SBnok7iov/O9DSx5VzgYiWnng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdH4Z+jd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdH4Z+jd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84A41F000E9;
	Thu,  9 Jul 2026 10:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783593162;
	bh=EjZvlpJSXYOhVZuRppmSko+dfxbbl2+AcegT2rC1JKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cdH4Z+jdnHyig2RoKQtqKol7ECXjkpU6SSRU97vFOWRucE8qG2E8WSJk05+E9cp+z
	 /5zCMDdX22Vyt1y7hPRNNG5pX29YmIP4UmOVxXWjOxSfFdUkNgGT5lGanbSFnr8zOy
	 v7RVuazvUSRGJLh0CmxM49K8Ym+6FyfuRGLH7aA2UyX6onQN4hn4xzIr9ovkIWtcfj
	 6ntAr6jJ7QKJm0GjDtbOLK/KWdaJY0hTlj5WVSt+UYDjHiyLwIKVDHBA2/H3suIW95
	 jO4gj33lrGzsL+V0ioy1eaQYQdzbTNxeX3t5oLRKgfXMuAEyJ0jr6ISoyHr5m1uTe3
	 pX+QvwkFVzG0g==
Date: Thu, 9 Jul 2026 11:32:37 +0100
From: Lee Jones <lee@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: st,stmpe: add deprecated properties
Message-ID: <20260709103237.GF2045740@google.com>
References: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
 <20260708-dts-stmpe-v1-1-1f51d15bb358@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-dts-stmpe-v1-1-1f51d15bb358@nxp.com>

On Wed, 08 Jul 2026, Frank.Li@oss.nxp.com wrote:

> From: Frank Li <Frank.Li@nxp.com>
> 
> Add deprecated properties st,sample-time, st,sample-time, st,mod-12b and
> st,ref-sel. The both driver drivers/mfd/stmpe.c and
> drivers/input/touchscreen/stmpe-ts.c parse these information. Some dts
> put these properties under mfd, but some put these under child node
> sample_ts.
> 
> Allow these properties put under sample_ts and mark as deprecated to fix
> below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/mfd/st,stmpe.yaml          | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Why is this attached to submission:

  [PATCH 0/3] ARM: dts: imx: cleanup st,stmpe touch screen related CHECK_DTB warings

And where are the other 2 patches?

Pleas send new patches as a new thread.

Never attach a new patch to an existing thread.

-- 
Lee Jones
