Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52533330D25;
	Wed,  1 Apr 2026 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775029223; cv=none; b=XX1+VrxY2QocIga+8nupI9vzAlxRjdAaDR/akjWwojaH5PaiA4pIM/bki1tpX1NitzVxSAr3+QFIz0FrK+vw08oLgEjn+Z3I6y3RcrI3nk3kcZgjAaU/+qKmjHu/dCgO81VW0puQt4o7+txFHeEmElH5HE1bHbUNYRw8wyFz65k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775029223; c=relaxed/simple;
	bh=CaHe2VUsZZDWm6ErzNKL9G35yXKCVCCCSuUqA9E9iog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEHtOg+GqnDFIuo4m9S/0pLeH+wlWsgX1gcQ0tsGFhRg+zeA5xJFjBqPaNnmYi5g/aujBGn8BGQ28RE8AMqLtPHaCBuvJfC602UdlHNXHEb7izIOFJ2UuRd6hvzd5JXQ9cNh6jfB2+LEpI42ydHc7+oYcw9R1Yv3tCSwJzE5UME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbRLgtYF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbRLgtYF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1B8C4CEF7;
	Wed,  1 Apr 2026 07:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775029222;
	bh=CaHe2VUsZZDWm6ErzNKL9G35yXKCVCCCSuUqA9E9iog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RbRLgtYFvPHl043mICoGZscSr/N7MotX+SGIZUfXePNNzlfCYjC1vieeJmjL13L1v
	 XHTOIE+lSdhB2HULMm42hT+KYQuRvNBuavSIW9yPgf8EX2zaU1zxC/XHxr/YVLAduK
	 L+Xp14uT7oOuS0CV8sSwdR1auQq40uHaUs7QEFGmKlrUa9MNfwOxXOVNbbvHEgw+DR
	 0ja7heziqQtqnoLP04qTWrQEr+BrbzQK7kzcj1aIz85GJK1EqHSkpEuoHwyRM+TiA7
	 2OU+9/G77nACau3rxtBHs8T4UIMvZ/Ve9pIvYV0XynYU8MxrCWUd7S0cTVm08M3aCT
	 jpU0c0LKOk8/w==
Date: Wed, 1 Apr 2026 09:40:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guangliu Ding <guangliu.ding@nxp.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Jiyu Yang <jiyu.yang@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: mali-valhall-csf: Document i.MX952
 support
Message-ID: <20260401-weightless-mule-of-opportunity-57f45e@quoll>
References: <20260331-master-v1-0-65c8e318d462@nxp.com>
 <20260331-master-v1-1-65c8e318d462@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331-master-v1-1-65c8e318d462@nxp.com>

On Tue, Mar 31, 2026 at 06:12:38PM +0800, Guangliu Ding wrote:
> Add compatible string of Mali G310 GPU on i.MX952 board.

We see this from the diff. Say something useful.

> 
> Signed-off-by: Guangliu Ding <guangliu.ding@nxp.com>
> Reviewed-by: Jiyu Yang <jiyu.yang@nxp.com>

And the review should tell you that. Did that review even happen? That's
a v1 and a single liner patch, so how basics could be missed?

Best regards,
Krzysztof

