Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797EE39A077;
	Thu, 16 Apr 2026 09:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331250; cv=none; b=ssWd8+57cObq4D8CkazpPUrobuOB0NqNPVWGPh/e0lMPaxPJb6XqYVCKXtFYw+QlDDIRiOF7ecOT7UgaOFU+A7eryZk+7fl3hqIT3TyRJeO3kcEXo2ETfpZOgaBpHVI9JMtD9kyIWFvXyr/aqcM3aR5pvTbcOoUrMYXokjMsdro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331250; c=relaxed/simple;
	bh=udiYC/LNkNflXeo6pYjFnMVROnJd6qFnN2r99vs66JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NP/vCtYLX+bXawnCnTYJqNUNo83pZ0miWwuuvb8woAIc+RFo+yJJUcR3DtLGHZP4PbQy4vzsqGPf4VAlzK1ebcVHR0rbPK8wQHMvgq80UbCkh9gBazzhMSppxG4S+sGkZkyBl1PvKsBLrFDne+AJqDT2ASvvatng+0Oi4E9gZMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPurLt4k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPurLt4k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2061CC2BCB3;
	Thu, 16 Apr 2026 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776331249;
	bh=udiYC/LNkNflXeo6pYjFnMVROnJd6qFnN2r99vs66JI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPurLt4kMWDBdtJqM+YZmdrjRupEFV9UMjmm8elShYTKqaiYBb0mEIqgRRR6fuJSC
	 cQwGuX0kkh9NVTdVLIgm7+x7lTfqbEVWvvZuMqQZcfflcM+Dy79/rxFYTCIrrG4LQH
	 Vb1AsRQ4AGmnZtXmiB6Qf/lMRjHMnpxTKshxO65F2tm5iK7bFhSF0wA8bhxgr1BJzT
	 tMIckRTNvDM25REHN66ZZsUSYawarL5vcWCPrch6NnyZwEuhW/MtaJAbKVvOyy4QrR
	 ePIbrl4a5nH+IzUcX0PqTDOytSfLyRnBHgB47dqWjYDc8f9fMHe+e7WSH9DRbaw7f8
	 ueBLNo+RRRgqg==
Date: Thu, 16 Apr 2026 11:20:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, 
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com, 
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michael.riesch@collabora.com, anthony.mcgivern@arm.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	ai.luthra@ideasonboard.com, paul.elder@ideasonboard.com
Subject: Re: [PATCH v1 00/11] media: Add iMX95 neoisp driver
Message-ID: <20260416-olivine-cuttlefish-from-tartarus-ad3df2@quoll>
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413160331.2611829-1-antoine.bouyer@nxp.com>

On Mon, Apr 13, 2026 at 06:03:20PM +0200, Antoine Bouyer wrote:
> Hello
> 
> This patch series introduces the NXP Neo Image Signal Processor (ISP)
> driver, used in the NXP i.MX95 SoC and future devices in the i.MX9 family.
> The series also includes updates to the generic v4l2-isp interface to
> support extended statistics required by the Neo ISP.
> 
> The Neo ISP processes one or more camera streams, converting RAW formats
> into YUV or RGB outputs. Its architecture is largely influenced by the
> PISP driver. To limit the number of v4l2 devices, the driver supports only
> one context, with three sink pads (main input, second input for HDR, and
> parameter buffers) and three source pads (RGB output, IR output, and
> statistics metadata).
> 
> The driver supports the generic extensible v4l2-isp framework for
> parameters, similar to rkisp1 and mali-c55, and applies the same approach
> to statistics buffers. The generic v4l2-isp framework is modified to
> factorize structure definitions and versioning, so that both parameters
> and statistics buffers share the same mechanisms.

That's a v2, not v1.

Does this work:
b4 diff 20260413160331.2611829-1-antoine.bouyer@nxp.com

? No.

Should it work? Yes.

Also, implement previous feedback - I see no changelog, so I assume you
just ignored everything. Judging by build process errors, it's even
worse.

Best regards,
Krzysztof

