Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB231BC23
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 05:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725600664; cv=none; b=ql8Rx7EF0/pY88bar+4V6AZ1NxZ13cL5Bo0Cy7EVIxGAsLQfbWj1qgdKM0UEcr4uwfyvHjdMIPZ5IqU5jH3Vi/BhdX/Bcf0MHdsUj3PGVtfLwnC+jny6FjlIP6tFqJjF13/iwZ+90QIYK22OJCTgwzwFkfiZlDVbM3e5tcDEHPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725600664; c=relaxed/simple;
	bh=xYRDfR7w4cvg0JE/SSRywsqcsK0ZVzCAWzanLbugdKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozeSsn/uQUIKJytVJvS3nCEOJ+sarkK8UQuuoMS8qlZvo2OSmZsVVdac3ZLrsn/1pCBIT9EYl9ZkAIVs0B5kq2KXnQ1j4GnfRW/lgYJab3uBwPIpMo1KyH01Mdfa4nPzeDwlz1wEBKRel9TK8i7VCX5wlF8I6Aj30sDQ2/qFnto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTnusOmK; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTnusOmK"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3df07fe03acso1004176b6e.3
        for <imx@lists.linux.dev>; Thu, 05 Sep 2024 22:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725600662; x=1726205462; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6rlojunx8GHInoLGCMntB+ZOAAQdHr69FYIGEn6wPK4=;
        b=VTnusOmKrO6nYheFQTY1zgTSqxyy3jTje2lrGQ+g0j7M4Ak2oE+9wkq/ziIN69nOdd
         TuhK9jyEvWuy9nU3RtwyQZVyzlYCEETRprElrYJs5iYu3CThPz3P8Z1mFi9s65qEVSoV
         wGXBUQvgsig8xrNzqy1MEld4MYmLSQjdBlvNUuHcaA7Ro+oflc0g59tXW4wHuPErnu3q
         +qE5wbC9LJlbuw+XDuSiAfVg1cQD7kCCF2x2v4vnqHL5yIFqxJh0+hAcfQs0fq2Bt+LK
         FJUdRzYn3cxBudFs7V9JTgiPP2k7W3gcNYZHVn5YpOsam4K87VeJB1a89TgmkPh6z/HJ
         sUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725600662; x=1726205462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rlojunx8GHInoLGCMntB+ZOAAQdHr69FYIGEn6wPK4=;
        b=a+735lIbfG6uGxuDoCPXgJDfUWg/8KB72+ytqv9HqtDua+kVfyS/lxW74rfVK6em+4
         XB0aAkaOuPgWKAYo0i7YhseF2KqULffsCVduGTxn5rYUo2yfD2XUZy4qWbES7oLo3W2J
         cWBwJILP5eiAzyUDl/w/kaSrtWw6/ZMdNa5e3DmlzavtOxPUyMTlZjRrpFV7z3yhzjp8
         7lek03hphe0pzQ5J/kX/I4qlh4sLFE8GzG6K/gQuFfBTjHTA3+1SrmsSu3LhLNN+Zh/t
         LthFdt43qqPF5HcdyLGeGWs+Bf+b0MTMRgvSIaP3DE11s3WfmTsmWFGNYgNcIOYOGxoN
         Z37Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXD4lKgwhnMR8HEYxCnzOffdpumhRcphJgm7ByFWqpECBUO4thC5wnwCojPvh3qyOBvaA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5+hM0zQLJLQrLrHuon2dXMRkTqByaql9Bc7BuZBmTj+EbnjWo
	WteMXZ+P52ix33rSKFUYE4cGpkGa0Uk3fd7qtMz9oR/0zPgqATxp
X-Google-Smtp-Source: AGHT+IGJhDHSeGSMTpCmO/BHOqkArJRSxKtV4pDbBAprpmrun6J+Xrj7nn6JiGoluHx0bZKiryy6YA==
X-Received: by 2002:a05:6871:580f:b0:260:e4ac:72e5 with SMTP id 586e51a60fabf-27b82edbfb5mr244718fac.25.1725600661782;
        Thu, 05 Sep 2024 22:31:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1de8:3062:3230:1a45])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d770499e7asm532882a12.91.2024.09.05.22.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 22:31:01 -0700 (PDT)
Date: Thu, 5 Sep 2024 22:30:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: convert rotary-encoder to yaml
Message-ID: <ZtqTklejytV9n74t@google.com>
References: <20240811214656.3773098-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811214656.3773098-1-Frank.Li@nxp.com>

On Sun, Aug 11, 2024 at 05:46:55PM -0400, Frank Li wrote:
> Convert binding doc rotary-encoder.txt to yaml format.
> 
> Additional change:
> - Only keep one example.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: /rotary-encoder:
>     failed to match any schema with compatible: ['rotary-encoder']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry
