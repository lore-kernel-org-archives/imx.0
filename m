Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0348E344023;
	Tue, 16 Dec 2025 06:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765866523; cv=none; b=Zf5Ccdhf7TqW2oORjs9nyQKjUMFWt2AWkuGyI6BcIfUwBRJ8rsR9i0DmHzQXf3ORrhfUmREFcQp17YjMOhq8rAN4UbqJQPJc5ua8udgkKSIQ5ecUESDUTtGuRQLNGJAhYddnnuWixwV+L6vp5T75zAA+cGQ2/1NtK3EtKbkVk+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765866523; c=relaxed/simple;
	bh=Kg7+MAqBbkvVPj3c0oyonZzZrN7j0BEGCa86ICkvAo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcW5DdjNF05xbYke5joXsCXbNCpCM2/t2M4UrFQWE1Ag5FC8p8L/HvdN9GnKWftbQPyPjKClx2z4IMFKJtiVTeritWxYESnP17awrFC0fLjaqBXLbD6vyPNL08UAIMAg3yfogTXUz/I7Vj5UkNb2csxgObEiffaXhPIHkPRMmt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTgQkNah; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTgQkNah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D341EC4CEF1;
	Tue, 16 Dec 2025 06:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765866522;
	bh=Kg7+MAqBbkvVPj3c0oyonZzZrN7j0BEGCa86ICkvAo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JTgQkNahVr7LQuzw7D15rFEq9pIYI/fYs4Lu7M+YkigOTSAmOXl56UqLENZEK5jz7
	 iO1mp/jXm+tIVqLTAPQcpd0Of48XSJRMhWDBHxA8vPZDlco6PhbJmsQmkpYlE8i3vU
	 9FNRlh/KrvddGs6M1tjMbZC9HJ0/0bY7/81imP+w+XyLjmbqrTOQ/wINyKD+1LVOzf
	 bGtT9oAoqZ8u+h5GckXKagBOGaEil8UUYLhvrpfbXO1EztTbUinjCa1qcPHCZNORdt
	 2WSUK6hTVpLCw7jILi3MIQ4MB0/B9xcS+wYuftl3Iwg6bpWtCIBC4MAN5zK/Ra20GM
	 GSepG+Z4gm+wQ==
Date: Tue, 16 Dec 2025 07:28:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: fsl,imx-gpc: Document
 address-cells
Message-ID: <20251216-placid-speedy-rooster-ffcfe9@quoll>
References: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>

On Fri, Dec 12, 2025 at 09:58:59AM +0100, Alexander Stein wrote:
> The GPC power controller is an interrupt controllers and can be referenced
> in interrupt-map properties, e.g. PCIe controller, thus the node should
> have address-cells property.

You could say here that there are no children, thus using value of 0.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

