Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963FD328610
	for <imx@lists.linux.dev>; Mon, 18 May 2026 21:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779139499; cv=none; b=jKzAiiAXreiIojN2HPJ1g0PtU2dX6XviKzVf+wSaGcB8dNNUNR5ijg4wavq3BgloPuWiYyCuo+q8m8Fd5ajvzE8EwFhzHoA2miOjdG/ozKiIi1uLLhMudGj82NoNVOqmN3UPyUaxdTpdFpkZDGCuCQ6NcdnTay21pr/3sEQuSR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779139499; c=relaxed/simple;
	bh=c2kzgtlmuCmGBxKQy6f/nzlz7pz4BpR6cOyGsGOmzIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsHaVAi87144UzIdKG6bpJMMOIsS2iNsrraSsThbd6pPzBIvftXR2kDV4j/aFVHmWtO8XYPdLtVOkUDlv6nwehy+AGpexWosHscN3cc2VY1EG61icVA7bP56Usfn6W7bDbdsWJRyvtgQvc7V5s71d3R6PXYx2gZtL1IrKC7RQ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKJNBFPG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKJNBFPG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779139498; x=1810675498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c2kzgtlmuCmGBxKQy6f/nzlz7pz4BpR6cOyGsGOmzIs=;
  b=nKJNBFPGiwscUa6nhcqUc7D+nL/eS0ed+O1n67svXgUd08ngJptRhpsl
   EgbPBRBSSna29YpRMtlMv7IFsvlnYOnDvEooP8W+yn0QrAEen8guFLKdF
   0rjYLf8c+cvzzwJ+kl4MestZrncODBAo6jpI5Qe+mxiFlNLYWrk1wcQ0K
   bl+8jUlkIDmQvSJWKnw6SB8mw78tFMP641c5LmxYejPq01swX3mmgfEQX
   bXi5/pLv3YVBq/CLxhM5E9NH0tX555k1elPNNhhSRC2e1Uhfrkh+to7MW
   jeFEdouRN6DChyWmwn8IvZcUvBxegSMjnrKrIzCe5l6P/pMAmxiK1DT5W
   g==;
X-CSE-ConnectionGUID: gbGxjhIsR0Gz34CkaJvioA==
X-CSE-MsgGUID: 9Wuszr0ORuKTCEzaWkVniA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79971702"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="79971702"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 14:24:57 -0700
X-CSE-ConnectionGUID: vHo2P8J4SIeUpFshKCynYg==
X-CSE-MsgGUID: 2qCXkziwRuezElfXAOBE0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="244553350"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.139])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 14:24:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A0FE1120E58;
	Tue, 19 May 2026 00:24:55 +0300 (EEST)
Date: Tue, 19 May 2026 00:24:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/7] media: synopsys: enhancements and i.MX95 support
Message-ID: <aguDpxP4SIcJWdcc@kekkonen.localdomain>
References: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>

Hi Guoniu,

Thanks for the set.

On Wed, May 06, 2026 at 04:53:59PM +0800, Guoniu Zhou wrote:
> This series enhances the Synopsys DesignWare MIPI CSI-2 receiver driver
> with multiple stream support and adds i.MX95 platform support.
> 
> The i.MX95 variant is similar to i.MX93 but uses IDI instead of IPI. Since
> IDI is software transparent, only a different register map is needed.
> 
> Tested on i.MX93 and i.MX95 platforms.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

This doesn't seem to apply to the media committers' tree anymore. Could you
rebase it, please? (Or are there dependencies still out there?)

-- 
Kind regards,

Sakari Ailus
