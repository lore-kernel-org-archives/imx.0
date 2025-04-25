Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC74FCA6B;
	Fri, 25 Apr 2025 13:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588076; cv=none; b=AYIzoFYoQZamZ1ytxIKOOqrosJCO5Ql4UPfIJpnWcwHtWdWMKu3RknZcyP1qWwJgBDRIE2ZM4kCdPJbWVvkbu1I8BjVJT1nPpExpaSAKUBmx/Dr4vt3Q7RSF+rNXM2b626+hlsP2kA2Y26FgX72os1KOHHPeJ3ZQCLKtAv4NiFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588076; c=relaxed/simple;
	bh=31rrBzJKtVXaPXzqnhnf8uanX8HXIkqblOzZfu8Tf2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efROcANfbzv6cJsG2+vxcCvh5ysd4U6V0bZ/I2+uoWKEqdUVH35VVt1zjYXSbTjXkwqYjYMpSrcAO0fozhah+adeVFeRE8z2kO3SOBVm3jYeJU/M2ddECfIcAgRU7LlLCMEyZvZcwZXfnNSfCrEKSp3Jrp4yTItdgN8m7sdRWYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X2nI6jkK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X2nI6jkK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1679C4CEE4;
	Fri, 25 Apr 2025 13:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745588074;
	bh=31rrBzJKtVXaPXzqnhnf8uanX8HXIkqblOzZfu8Tf2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X2nI6jkKd39XBM/pgDRNBBfMhHSLk14fL7Axemf/2umhDr40foDmDOIbuGIkNYQBY
	 PW7DyBLyzGnda5S2D3CWJQp5P64DWb0ezWkNkHXJA0dBtx72hLdujxyrdos1PUhRCE
	 afceqYOdwMTCF/eKcsBrO4sKdC4OYa1RT/85aD/I=
Date: Fri, 25 Apr 2025 15:34:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com,
	robh@kernel.org, conor+dt@kernel.org, swboyd@chromium.org,
	heikki.krogerus@linux.intel.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/4] usb: typec: Stub out typec_switch APIs when
 CONFIG_TYPEC=n
Message-ID: <2025042521-curtain-salon-7db9@gregkh>
References: <20250422115055.575753-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422115055.575753-1-xu.yang_2@nxp.com>

On Tue, Apr 22, 2025 at 07:50:52PM +0800, Xu Yang wrote:
> From: Stephen Boyd <swboyd@chromium.org>
> 
> Ease driver development by adding stubs for the typec_switch APIs when
> CONFIG_TYPEC=n. Copy the same method used for the typec_mux APIs to be
> consistent.
> 
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> ---
> Changes in v2:
>  - pick up this patch to fix build error in v1
>  - refer to https://lore.kernel.org/linux-usb/Ztb1sI2W7t5k2yT7@kuha.fi.intel.com/

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
