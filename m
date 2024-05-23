Received: from mailrelay2-1.pub.mailoutpod3-cph3.one.com (mailrelay2-1.pub.mailoutpod3-cph3.one.com [46.30.211.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB944187F
	for <imx@lists.linux.dev>; Thu, 23 May 2024 18:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716489764; cv=none; b=Glczy67XxsmBKWWbCq+OP75CMOAhMMP97w6oTF0Xr9f1b3fnGZUQggFbErKkjLfTQ9aSlyOOMr214lk6sT8irqO+CWwWU/lH/9J+ZU9GX4rR+VS73DG/SSTxW6fYnf/Ff7HEobkQ+sZtmssnfsSDxYFVLTNQkxnOQl05Zbhe/6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716489764; c=relaxed/simple;
	bh=dAl0233sGw+KB10rX8qt3kR7SwEoRcMEempStjwO1xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2kuL9rOIWF/Rrk6iAJ4NVXDlKEdligCW90XVw5M5d18mXiL3fsKUUTFkEF5aZ2hkDw6DIowE9V8ehl+ocUiGoQXekvJQJw3lReuggUrrQ3wo23QJ9EFXmJnkiq0J7d98e5X8X0zWUeAKfUq9H9CbJwSXb5Yaiyghw4rVtaiA/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org; spf=none smtp.mailfrom=ravnborg.org; dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=CSNk1Yvj; dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=WIprwJPl; arc=none smtp.client-ip=46.30.211.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="CSNk1Yvj";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="WIprwJPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=mqAiIL9UmsTZ5nfVp6r06fBx7paxMBf8wn1VlFeMkQE=;
	b=CSNk1Yvjxah3rkkxgpelc0VOPWIp75OPEQqWq1pcodABKvFFnSQXrVrenDn67tfY3D8higtjFf5q+
	 f0TvD1Xu7CHYT9QFQsG9OcCU7x8/z4c95fh6Uf9WYi0vQ6qIaFLVX6h8lsXjJ4DbD84yaMWHR3pyp6
	 GZLQ6b38p9ymFQvfMUNfPMbTSUYJx15BVomjZtwE3zJL++339XDSCo0Fk7IA9cleqdQlFI2m7eHQYN
	 D2fN8Kiad80deL3bZJyVrJahjzYGWLb4MBhmBE+/PEu8u25A5abKXx2Cts49BDtJxevcGf1u14wI+b
	 5KRl9Shn7wR/OMlcrYHM1Q8rTi1Kuyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=mqAiIL9UmsTZ5nfVp6r06fBx7paxMBf8wn1VlFeMkQE=;
	b=WIprwJPlFWVWsTuv+1kxtKhJKxGQvFhUAW6MY279TBYMtIaS5vQ91nOVFlbGExQxiLG2gBsvHPe9Q
	 ZgCMlemCQ==
X-HalOne-ID: 10aba6c9-1934-11ef-91f6-953526d7c221
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 10aba6c9-1934-11ef-91f6-953526d7c221;
	Thu, 23 May 2024 18:41:29 +0000 (UTC)
Date: Thu, 23 May 2024 20:41:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm: enable -Wformat-truncation across the subsystem
Message-ID: <20240523184128.GA523806@ravnborg.org>
References: <cover.1716479340.git.jani.nikula@intel.com>
 <719debc351075abc36b2573266bfd4d963361e40.1716479340.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <719debc351075abc36b2573266bfd4d963361e40.1716479340.git.jani.nikula@intel.com>

Hi Jani,

On Thu, May 23, 2024 at 06:51:09PM +0300, Jani Nikula wrote:
> With the -Wformat-truncation warnings fixed, finish the job started in
> commit a61ddb4393ad ("drm: enable (most) W=1 warnings by default across
> the subsystem"), and enable that warning too.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

When it is enabled for all of drm then the explicit assignments here
could be dropped I think:

drivers/gpu/drm/i915/Makefile:subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
drivers/gpu/drm/xe/Makefile:subdir-ccflags-y += $(call cc-option, -Wformat-truncation)

Just a drive-by comment, I know this patch was mostly for the bots.

	Sam

> 
> ---
> 
> Gut feeling says there are more issues, and my configs just don't catch
> them all, but let's see what the build bots have to say. ;)
> ---
>  drivers/gpu/drm/Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 68cc9258ffc4..644613dbedda 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -16,8 +16,7 @@ subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
>  subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
>  subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
>  subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
> -# FIXME: fix -Wformat-truncation warnings and uncomment
> -#subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
> +subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
>  subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
>  # The following turn off the warnings enabled by -Wextra
>  ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
> -- 
> 2.39.2
