Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5480A4D9915;
	Wed, 13 May 2026 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690712; cv=none; b=RchQkhB9r3Kn9X6DlbZ1rzSwm8RzSncrxjl6wP9V3THtlDcqFAFln+DGhzbHXgU8srZj4pOwwZ/jv5oBSIeX7Bo7UMkHrt95G4ZU10dYQ98FCflxeOM1dy92wNwkThVxnhFxB2MnEgQKLIARhsAHyu1iMfTmkPSTd9cWwFVr/rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690712; c=relaxed/simple;
	bh=msDVtcqmbmg66KjNFHJpNOm8yFfAcfXZQ+MbCdSjyII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWNoYZIS/TML6jIVVE0hXxY6d5I6oz1ZUYS0QYQgVQ7XiGVAYxTU7R/048kQhNmJNTgB6dfENDWFh49MHLQhVG240IQqsqrwsjxggO3+djdeWuR6+O/s6RBsOKhpF2+TWb6UFnsCgVyPKGzYmo1FCjfI4WZJy9R5yeTHDUelhTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Umk+nQqf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Umk+nQqf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD15C19425;
	Wed, 13 May 2026 16:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778690712;
	bh=msDVtcqmbmg66KjNFHJpNOm8yFfAcfXZQ+MbCdSjyII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Umk+nQqfftUIQjg05CAeja8xnssdz9t0+lnmY9bCiojocCGCPcSDmJzJt1/etBL6U
	 hqjNbZXsGJkvxXpwIwd5SjmBOdhvmiRMv5oP1VnZsUlIn/a6VdSbeiMOcQK+e3d7vM
	 p8i44SrcPHtfgfN7URfm225mfu6GDVZjoWNLnRPO+YRZeTB7f9v4QJ+GDjfapd+imO
	 EzhbxAYNUJORt9ExeMNZNiLp/+fEC/TFDGeWo1XmibrzNBZzClxDaKgBXOPURcUbMF
	 mPnKHbsny1EWeDebt7n00Ken2sNqEPdrTHRhytSi9dS5iJXVBf0wSkVoBRRHUKzCJF
	 vjj1d03javrBA==
Date: Wed, 13 May 2026 11:45:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: add deprecated property
 'port' and 'display-timings'
Message-ID: <177869070825.1285462.2467866866860816055.robh@kernel.org>
References: <20260511220924.1905571-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511220924.1905571-1-Frank.Li@nxp.com>


On Mon, 11 May 2026 18:09:24 -0400, Frank Li wrote:
> Add deprecated property 'port' and 'display-timings' for i.MX5 SoCs (over
> 15 years) to fix below CHECK_DTBS warnings:
>   arm/boot/dts/nxp/imx/imx51-apf51dev.dtb: disp1 (fsl,imx-parallel-display): 'display-timings', 'port' do not match any of the regexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx-parallel-display.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../display/imx/fsl,imx-parallel-display.yaml         | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Applied, thanks!

