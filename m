Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB97136922D;
	Thu, 20 Nov 2025 17:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658912; cv=none; b=dcXf8j3oKhgm1J1w0CQg6a3F8jw/yuzZ0BhTASPgWv3t8aJWdhKeH6xdtnzUgc+gfz0Wq1ohFU42P6uU00wYSWWU//bxjkuU8VM2gBtyfLqyyjBHQIvlOXv+M9bowQukoo3mesAm4DAOk3oCuaAPel3/I6iq2qEWbWc8vo04BZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658912; c=relaxed/simple;
	bh=tUJeMypbWx64/Z6otC6Zk4ZaZQUUS8H+FmWqI2gi1+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfrX0DZLOuRjmc2mBM5Ad0Xg4/xFG3pN7GJnviPQGdWrOBDfGWtKnnxhFjb68y+yL8mgbK7J13Us7w9K6+BQS+qNM4LgTMQnkuSJbWHOG7St0EzBTUW0wiaRvgBhQqPadYSOPctBPKc29mKAmtuqVlgeS25F7RRf+Wo9LIlWplc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fvihmd45; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fvihmd45"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9A3C116D0;
	Thu, 20 Nov 2025 17:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658912;
	bh=tUJeMypbWx64/Z6otC6Zk4ZaZQUUS8H+FmWqI2gi1+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fvihmd45/mBHgMjyHRpRIgcbXtJm3kydpQz6CiDR3/QE1c9N9zXA4ooHDUYYwDcQ5
	 MhmsUfDUBnGZU3vHANf6U3dQpZl4uMYFagQxAZZbFeEzcm7vtoiiR/SV6cdDXER6Sj
	 Q8qKm0Lxo8Xm3BGaukHDsmUoFaHlP1JhT2zHvD2pyRm6pgMqLdgpiZ19Ira+7dIthY
	 uVr5Mwj4E/DvjSkWL25HduORAAP4MFR2h3fY+40fId4dGL+q4o0SlfX5043f+oMfBK
	 j6fmPIbHizjIcP/d8oWgqF06QhBr9wdJR8J31ziPXZLuuWS4dW48t5wSVJERtvt720
	 v8sZqCeoZS8NQ==
Date: Thu, 20 Nov 2025 11:15:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Eggers <ceggers@arri.de>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: eeprom: at25: Add Anvo ANV32C81W
Message-ID: <176365890864.1562501.17836862471978863678.robh@kernel.org>
References: <20251118121513.88352-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118121513.88352-1-marex@nabladev.com>


On Tue, 18 Nov 2025 13:13:10 +0100, Marek Vasut wrote:
> Document the compatible for ANV32C81W 256kb Serial SPI non-volatile SRAM.
> Although it is a SRAM device, it can be accessed through EEPROM interface.
> At least until there is no proper SRAM driver support for it.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Christian Eggers <ceggers@arri.de>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Markus Heidelberg <m.heidelberg@cab.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/eeprom/at25.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

