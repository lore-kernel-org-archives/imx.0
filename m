Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09467341AC7
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 08:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774340327; cv=pass; b=inhA8z3dlqX2G+Ulr1F4Zhc/b/fKkHuzkAEsZBCTKpqm7PfAZRszSEUcFhoEypJ1rGlYBzBRBN0Uy9QypTkmfYgvYVvxuVKVJqQ/kr2UT88M9SE5JpTfxDqLl5HDKA6Y8JkJcVJdFnYQORQtcVG4dExNjD77s/1HxYQBj7P5xHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774340327; c=relaxed/simple;
	bh=Q1dKR70HQFgxVCWflFpqcIFdbSxaqVVjYmsWy1/Btgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKdDqVNJCeJvVPUcjQoxCmBZV3+lE6zubYQ/7IpsxutrkX3SxiN4tIordFSpZU6i4TqtP9dV/BNTqMtGc4liDrki6jqt18RJuGm7kyDK/Bxw2CxkgpuHpl0Y0jugKkH/dALUNYD4wcYETOqFojAnS+5QFvOel79TmrrQ0Ke7XBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=wc0OwZ6q; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="wc0OwZ6q"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fg2xC733NzyWD;
	Tue, 24 Mar 2026 10:18:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1774340320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEtrtkfyr8g0UIJm7Rk/FT+do/iltAPNcZDSilZOzpU=;
	b=wc0OwZ6qUi2qFmuP56crqFkhDLm1ywwTsQRGDriZ/Fd1YQ3dfHqSa2Ij7f95gEw8RDQTwE
	DO36EaMd6AiFhrPG0tXoUdmYlUoHs0NXev+2e4GDKJNZruESR5E15iiY1mwyOPgRtaaATP
	B5D8DsSk/PGqtdKuiquyXdZN2OMt+DQ=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1774340320;
	b=KT6yMSh66+xRPt7l/BFGCaEJUIQynlX+I+aitukMPpfq1OkmZqWU8VXq5NmCq+O9BvvQn5
	uVhusQE5bLktcFNk9hndjoRk2FO2YyA/basH3QDLzOU9JBR3fps7nJR+ygm+WnvgxLRlMH
	1xK3mMitTfM//OSCwUS0mDeRoZkfCys=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1774340320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEtrtkfyr8g0UIJm7Rk/FT+do/iltAPNcZDSilZOzpU=;
	b=NGss1c/cyEdX4OVc9iJZz6MElux3sZiAavXeToOMlYUUgP9I+h8GI1uoZph/Jq/vDJKjn4
	I+HG3C4CKCtziZ+1I3K5aSq/AM5FXkY/h8gYAlphfL7NbTtKs1Vp+xn6KjEB0lFcfnpDuh
	Kuw2UtSBTI087BVskBXOmJ5Vgq9FXbY=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8D704634C4E;
	Tue, 24 Mar 2026 10:18:39 +0200 (EET)
Date: Tue, 24 Mar 2026 10:18:39 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.li@nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>, imx@lists.linux.dev
Subject: Re: [PATCH 0/6] media: synopsys: Add imx93 support
Message-ID: <acJI3wYnl8_g4WpO@valkosipuli.retiisi.eu>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <acGQNIUKqfh8eWNB@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acGQNIUKqfh8eWNB@lizhi-Precision-Tower-5810>

On Mon, Mar 23, 2026 at 03:10:44PM -0400, Frank Li wrote:
> On Tue, Feb 10, 2026 at 12:11:07PM -0500, Frank Li wrote:
> > This 3rd time try to support DW CSI2RX support for imx93.
> >
> 
> Laurent Pinchart and Sakari Ailus:
> 
> 	I am not who will take care this patch?
> 	original drivers/media/platform/synopsys/dw-mipi-csi2rx.c picked
> by Sakari Ailus

Michael seems to have questions on the last patch, too.

-- 
Sakari Ailus
