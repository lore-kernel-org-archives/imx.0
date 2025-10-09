Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC7211713
	for <imx@lists.linux.dev>; Thu,  9 Oct 2025 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760014851; cv=none; b=Tzj4w3qs+r9P4jx7wyV/RxrYUr+qtW73gX+sb6uP7gujHBdHDyxK1pELu0OEZRmquiqhsaPtpf/FxdiET52LSaO3jrGSrkMsjkcUEFikcRfn/0dKqCg5R8W1rDXltevHDxhYSZbQYZHD0oCuSaYE9A93RE1b0hGO/ZeTMGvxVas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760014851; c=relaxed/simple;
	bh=2gf6pqNjzmoPeyJUzHKtZEz8WXFWsv+O++Fdle7Chcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dMfkCHuUn9EjyGr0Ok+DwIK1N8rMPWt6xIbhwuJCBiXH0GEo4/MR8pt/acHHHwAsTcy8tdiJhnuP/wndWTJEyFfP0FOCGDDdcsf8P1+W75uVUjtogheQFQtCqdr1MbrGsdhOsE5YxM+k9KKQct+DtVXAbQOVwiSOTfFz32+/p0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AB6F176A;
	Thu,  9 Oct 2025 06:00:41 -0700 (PDT)
Received: from [10.1.34.29] (e122027.cambridge.arm.com [10.1.34.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23F373F59E;
	Thu,  9 Oct 2025 06:00:44 -0700 (PDT)
Message-ID: <7c3b219f-f504-4c4c-a13a-6a25a0eda277@arm.com>
Date: Thu, 9 Oct 2025 14:00:43 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall: make mali-supply
 optional
To: Rain Yang <jiyu.yang@oss.nxp.com>, imx@lists.linux.dev,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.co, simona@ffwll.ch, marek.vasut@mailbox.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, Rain Yang <jiyu.yang@nxp.com>
References: <20250928090334.35389-1-jiyu.yang@oss.nxp.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250928090334.35389-1-jiyu.yang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Series applied to drm-misc-next.

Thanks,
Steve

On 28/09/2025 10:03, Rain Yang wrote:
> From: Rain Yang <jiyu.yang@nxp.com>
> 
> Not all platforms require the mali-supply regulator. This change removes
> it from the required list in the binding schema, and make mali-supply
> required for rk3588 only.
> 
> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
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

