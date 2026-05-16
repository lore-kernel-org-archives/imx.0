Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D404405C46;
	Sat, 16 May 2026 10:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778926244; cv=none; b=X86p9+RwTQRjfHkYZmB6DpXqUL9hbWV69tsnCsYfyfNqAPI98LgddFInDhOYkIHctuKe/Kwwv1pByGV2Trsf0atxZSwD6Y/XuXyNwsJmD+jLrlyfIX2FblDjZRlXdMJIKTOCay7SELgKH3B0XzoTtwHXfte7jN1fRglSdKeyq+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778926244; c=relaxed/simple;
	bh=1qvLF+Zqi75df4aB2OVRCs7kHbPNN8nrk32CUkEYElk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1aSeIpNHBh0rMSeyvjYaKQeItuPlC8brLrHp4d4oNqDFxVluospLU+zGRcJAlLbLiKPhdW8O+mqe+9XugsjZlo8eIKDjcsSdAyjj8fOv40q5n3EvJbeUrhzNkNbl230FACazQRF0/WIRz0fgnOMq9NiYkYSzqOmGyewjqgZvpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgCmL5Bm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgCmL5Bm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6886BC2BCC7;
	Sat, 16 May 2026 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778926244;
	bh=1qvLF+Zqi75df4aB2OVRCs7kHbPNN8nrk32CUkEYElk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YgCmL5BmnQv6t1PCS9Ixh+uGJu+zHYaCC956+X4QQEwklkQaN6XBpH9i7w3V1eivo
	 aNmDZougxQazSBdQ5XtWLR6Z3hihax05oLgszwI6FKgtgDxz7sFpRzmG17CQuKVklA
	 0ywYaKtBLScEsDTIIL4vMwZTxUtZmShcWwzM64CRWvxOfmt3UpSkS4XL6L+yd2XGW4
	 kmUvW6z6a1s0UFKHw2Bm3qSMAukMpMmb3xzWNAkUoaBcL1O3GVKYJuT0ayok02KdHt
	 nLaYjO8mZZxxtZjGrpElYVPrbB+tmXNzDoZZQW3Fiovo6xcaJdGjcE4AKuQrthXkTx
	 zR36C89fxi1rw==
Date: Sat, 16 May 2026 12:10:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: display: simple: add avic,tm097tdh02
 panel
Message-ID: <20260516-gigantic-enchanted-lyrebird-f39fce@quoll>
References: <20260515195935.2415466-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515195935.2415466-1-Frank.Li@oss.nxp.com>

On Fri, May 15, 2026 at 03:59:34PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add compatilbe string avic,tm097tdh02 for AVIC Optoelectronics 9.7".

Please stop with these single liners without any explanation.

Best regards,
Krzysztof

