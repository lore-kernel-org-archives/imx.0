Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56062280A52
	for <imx@lists.linux.dev>; Thu,  2 Oct 2025 06:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759387141; cv=none; b=D6zBjqM86XQFMtU2ebiIPBM16Fqp6N/9nB+/z1dDMK1OXYYJYOnEfFVZTTNA33fJtLg2YJpUZqdrApsIMt+MDNe0scI4V6fbhEWRDq+SR0v56foQ44QPA+JPuxCT8Dq+J/zEpESVvtjdS5Sq6zI9nooBZBdD4NPBf5dy2FkKOn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759387141; c=relaxed/simple;
	bh=Cq9tgCOrO6tTDVdXzDEPvzI63oo0/Jr9pKFIJgOwIIk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k/FnSnXxCPIgsmi74pA5frg4faczR/i27F3DiKlZDz0tEiQVxrLbP+exR5wNqs+zcYfxSh9Myvk2sUrQLIRJ2qjyIWUgpAfejvtWjbCqlaHJTk7VUorsw9exN3sZ4edYFXezJkEXXZdGJ8CzV0QJaQ3+nPOn5m3G2bos1W+C4Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qo1aCpJa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qo1aCpJa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759387137;
	bh=Cq9tgCOrO6tTDVdXzDEPvzI63oo0/Jr9pKFIJgOwIIk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qo1aCpJaSG/ZuVtn+ACWpWxctNoVO3s6DdIii3zIus3Q11a97NkbBkAHpJdva8vhN
	 ZV0iWizRwszLoyVx8avtisKCLV5S/LR7GS4URv6Qsf76HQm1pesrCK+3Zb5urqE5lZ
	 PI3yYGftaHFJCW1BIBSdftNv/IuU7CWc163qZldK9m109w7NhfSAZ+hob6BfGZz9Pz
	 qYChQGv464O3lUg3HsRa4i59TZvrfJE1VfRXH/UberQ4YC7k1exMYjoNFAzM3g8KvE
	 7518QcVHSEOYDk8i/jixlN0uJZnCP7JBQGRJkAmMxYRnyaA3772UNLJzvAQCyyr2b4
	 ldM2mhsxFIgOQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D06717E009B;
	Thu,  2 Oct 2025 08:38:57 +0200 (CEST)
Date: Thu, 2 Oct 2025 08:38:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.co, simona@ffwll.ch, marek.vasut@mailbox.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Rain Yang
 <jiyu.yang@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall: make mali-supply
 optional
Message-ID: <20251002083850.2be23128@fedora>
In-Reply-To: <20250928090334.35389-1-jiyu.yang@oss.nxp.com>
References: <20250928090334.35389-1-jiyu.yang@oss.nxp.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 28 Sep 2025 17:03:33 +0800
Rain Yang <jiyu.yang@oss.nxp.com> wrote:

> From: Rain Yang <jiyu.yang@nxp.com>
> 
> Not all platforms require the mali-supply regulator. This change removes
> it from the required list in the binding schema, and make mali-supply
> required for rk3588 only.
> 
> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml          | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index b220cbd5362f..ef9791d8ed95 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -92,7 +92,6 @@ required:
>    - interrupts
>    - interrupt-names
>    - clocks
> -  - mali-supply
>  
>  additionalProperties: false
>  
> @@ -109,6 +108,8 @@ allOf:
>          power-domains:
>            maxItems: 1
>          power-domain-names: false
> +      required:
> +        - mali-supply
>  
>  examples:
>    - |

