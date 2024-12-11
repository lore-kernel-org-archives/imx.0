Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03651A8402;
	Wed, 11 Dec 2024 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733909505; cv=none; b=Et7BTr8Hezhk/86XBA6pPhin3kUkVMcRgI0R+JxlPEjhprEQq+HnUAQtZNi+Y4E98T9/q016U0o8qF0VcTN8X6yhfMWKXaa0BhgZ1x7mWZNsTCkob/ad1/3T/mkIP5twFknT/nIeZzgAdGpuxj8GmEcflwu61nenHVhbB1lB33g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733909505; c=relaxed/simple;
	bh=JNi0/3oudx6uDms5WbJLo0swIVqX1h8w+/7VjhgYUGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1Uck0hqqk0kz7VVwqq6LcBXqp3UEPyU+/sjj0WF/huthjjOj5c1YrcdYXzNLlt9Jh9LqiQleKCE9sCFS/o5RaX3bdHeokBSd3UdEs3Z0+r0AGdeLQwH2Nj26Moo3CvxnFxNTT1W0X2qTWilevcYxq2vt5Rss9Z+ZyVIlq6mEHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvWqNMMX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvWqNMMX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875DBC4CEDE;
	Wed, 11 Dec 2024 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733909505;
	bh=JNi0/3oudx6uDms5WbJLo0swIVqX1h8w+/7VjhgYUGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvWqNMMXvUhTvZWxgzetbfm6yY3dOIOEBxzvPnoz8/rM8f35CW41AWsUko76vGn0W
	 gxAIsC1oHBcU61LVKG1Befs0jxv3rey4zg8jglsnGTEbY2/dHpyVxZoMaKvtyGxBd9
	 qHIgcXyNAGNBEuIg3bznfrMYmzQmeXaXMAwVc4qxDebrbYQxSCyRx7NLiRjJY6Fv3p
	 nJx4fiQlVzK5akanxGBIVKOqu19SUl4x/3KO1iTuvdQUJgieGyZNG0IqRqJntyj+GP
	 ly4ne6+N5h8xCzgSiLG5HHCrbQr4fudCr7dQMwa2RzCo5H/iXKkRaYZox8RweQpx5G
	 Bk4kqeJXcE4Vw==
Date: Wed, 11 Dec 2024 10:31:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel-lvds: Add compatible
 for AUO G084SN05 V9
Message-ID: <yujvdu3s6v7z7th2lrdscqfxocx2zy2u4owakisvnjppz2udqv@5ok2rcf4exd4>
References: <20241210105705.116116-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210105705.116116-1-festevam@gmail.com>

On Tue, Dec 10, 2024 at 07:57:04AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The AUO G084SN05 V9 is an 8.4" 800x600 LVDS display.
> 
> Add a compatible entry for this LVDS display model.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Added devicetree@vger.kernel.org on Cc.
> 
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

