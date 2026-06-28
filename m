Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF05E363C75
	for <imx@lists.linux.dev>; Sun, 28 Jun 2026 20:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782678499; cv=none; b=DEkFYfu5dYcNSUPibARryz6/BdH6C2s572t9KSMDNFmA1vf3MYGRfkBNBwS2CHks5GFgB6OnFecf0QCuR7b755Hty3nSkqRfeeeMViFM7gC1+UIABrINV20tfgW+ES6HKBBpSry5xOfxoaOv0LczYc+CucZaDeKjOBaiAskOkVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782678499; c=relaxed/simple;
	bh=x5Vi4f0phvjV60V3TXIOIorQbkIhfFhMCJ4c7HWwdqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzkapRiazSD2M/0Uqs7i4qpumnb1l1U0Lxrhpz4izUk51KzP8soc579i2ItimiGlCnZsRQngBqlRGW9lLVoIx/hMVi0a0rNoVo5YHCZzSJU0lo25ddMhTGnnDgRmUENX5wEGZnXfhGEvTprI3nkpioDrq/JjzmGAaZ4nVb0zG10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKn7cF+Z; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKn7cF+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782678498; x=1814214498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x5Vi4f0phvjV60V3TXIOIorQbkIhfFhMCJ4c7HWwdqk=;
  b=bKn7cF+Z9KvPEAC/JgqtbVIreNirgZFH+j8KuUzh1ajj+/osD0aK/T3R
   M7SFqv1XhtAJnGkFbgF7PMP/fA/gtHLZYMlNFpZtlM/uNNID/63yI5eE9
   C8pQ1I92if9YnDWWa+SPpQsTOKO0QK8F68czPwQd64wkYUfoKp2AZ/n/p
   0VNN9M94ocJ/ArtPzIYcjtXSwpTm6EGjMUEcH8FTA3SqLuw5/XqI+uUw4
   KRxgu0G5TZHuz2tyer7ohQrLKfAaZK6K7jYj6fMdIOLVTSQMS2Nw5m591
   T8HUXiKsZcYQ9brlqdLYGvFhmyHKvlfOhngnAc9aBsTZLcFUUORf+8ccR
   w==;
X-CSE-ConnectionGUID: XTfmnUr4Qr2xCkBKptmmhg==
X-CSE-MsgGUID: 1mW7p7RoRtqw779ME5eB2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94860431"
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="94860431"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 13:28:17 -0700
X-CSE-ConnectionGUID: 0nckVlaHRHaa9RU2NwKC9w==
X-CSE-MsgGUID: QfjrX7T9R5Wi5lax0QCKnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="249152241"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.193])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 13:28:13 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 229E0121C1C;
	Sun, 28 Jun 2026 23:28:13 +0300 (EEST)
Date: Sun, 28 Jun 2026 23:28:13 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Guoniu Zhou <guoniu.zhou@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/9] media: mc-entity: Store parsed V4L2 fwnode
 endpoint in media_pad
Message-ID: <akGD3ZjW6GPHHI3D@kekkonen.localdomain>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
 <20260624-imx8qxp_pcam-v6-1-4b3f45920d2f@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624-imx8qxp_pcam-v6-1-4b3f45920d2f@nxp.com>

Hi Frank,

Thanks for the patch.

On Wed, Jun 24, 2026 at 04:37:48PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Each media pad is associated with a firmware node endpoint. Capture the
> parsed V4L2 fwnode endpoint information in struct media_pad so it can be
> reused by consumers.
> 
> This avoids reparsing firmware node endpoint data every time the endpoint
> configuration is needed, reduces duplicate code, and provides a common
> place to store endpoint properties associated with a pad.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Assume 1 to 1 map between dt's endpoint to medie pad.
> Change in v6
> - new patch
> ---
>  include/media/media-entity.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index d9b72cd87d524..4a3785cd9f370 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -20,6 +20,8 @@
>  #include <linux/minmax.h>
>  #include <linux/types.h>
>  
> +#include <media/v4l2-fwnode.h>

We have dependencies from V4L2 to MC but not the other way around as MC is
(or was?) intended for wider use then just V4L2. I'm thus more than a bit
hesitant adding any references to V4L2 in MC.

I wonder what Hans and Laurent think.

> +
>  /* Enums used internally at the media controller to represent graphs */
>  
>  /**
> @@ -230,6 +232,7 @@ enum media_pad_signal_type {
>   * @flags:	Pad flags, as defined in
>   *		:ref:`include/uapi/linux/media.h <media_header>`
>   *		(seek for ``MEDIA_PAD_FL_*``)
> + * @vep:	associated fwnode endpoint information
>   * @pipe:	Pipeline this pad belongs to. Use media_entity_pipeline() to
>   *		access this field.
>   */
> @@ -240,7 +243,7 @@ struct media_pad {
>  	u16 num_links;
>  	enum media_pad_signal_type sig_type;
>  	unsigned long flags;
> -
> +	struct v4l2_fwnode_endpoint vep;
>  	/*
>  	 * The fields below are private, and should only be accessed via
>  	 * appropriate functions.
> 

-- 
Regards,

Sakari Ailus
