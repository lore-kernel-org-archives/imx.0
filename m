Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA71E298CA3
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817047; cv=none; b=ksWWAKWFkzD/P4P7qs2bgWWY8aaEOwUHEYwNL63ANhqEAArpQeJYAw+ylW4OCakYBoUaWZU8A2m1l/7uJ5GO9Oc2SOs9g+sPE4QveTTAHKtu0ql2otyr55ToGsEt7fT/mcRPPZEkW0JpZs/yUDXkARhwT1JiuIc3Puud/CLdy+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817047; c=relaxed/simple;
	bh=rxONkSw+u8dslVY1B0mzmOY/vdK/Blvlepq4yW8E0O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJxVZN7ERT56XPsCR8JdBdECI++25ki1wYLxFRrBoqaGMnyg/dntIynVlaVXbyf8PUFQo4wS8tcl8TbnAKz26AEymexZLzXUgiNtH7DeGnWdDVhw1vY+xQ5fQw9McX/PKNrj6cMt9euH0rgWo2Swtp8dgxwKAyVOw0Y6fRiJxQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQJQwna3; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQJQwna3"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-327ceef65afso5314618a91.0
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756817045; x=1757421845; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yb8drcEYLJ/G3KDmSU2SdIBlSH9YRBB2QB4119jTYcY=;
        b=iQJQwna3YYGHnhzEZAtO53FmqqxLMobw5eJDuaqcFnTNVo1wPDzY2n04BTeq/PyFMv
         DYWJemrKJcB8r7Asg7fAydrkg8eYzr722FQXa/m4glkCQUeiArop/apM2zkq41ZX9xII
         94pejY/qB8pBSBcgvp13gtH2tQHv9lirMlHNjFEMjrCKh7/k8C9BAUyA/k/fthJw+LB6
         djC4awADClvYB2H8bBKr4xd/jY9txtWoTNdosqC0W1tZiktBpfH+TpDgcETi6Ijr1+79
         hwOEpXgjZZT110rkUcJ36ZIJtl6vnRjABl0YawPvsfBh4lvPPk4H5S7720cqYeBPsza9
         b8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817045; x=1757421845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yb8drcEYLJ/G3KDmSU2SdIBlSH9YRBB2QB4119jTYcY=;
        b=LWDff6wowwj43iwmedrVFtGKbCL36w0POC21vrvHEO2cDXmnRioVfn7Cgmvlpv+CD3
         XN293oUr2GRepKyWvEIDkC2g3JBSCS4+OfEaz2hvUuQQuo214oCVoG1aNaxU7mZ/AnBi
         PSU0Uy0ooEl4Dsh2nCKIj/NqIfx0GmZYC0c+d58H9eXs/4rYE/jEWX5tZkB/v3tqCCxP
         QTejPYhrIdwhF76uDBTSRBnwGMYKs5xqMacVJICwi5TFXhuHDsJHeEzrlJ+Nu/eugPz3
         MzBkdDD/UE6r/6D8viw/jKWgRxVW8Yc1OqCNVMVrJAFP2s7O3VIxgK514CfdBKdXVi33
         vsgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXtvioqZXFyGvZ3PtU8Zgs462Vn5eScQhebWlIWjEOsM0/GM5W/HtRYz/XJeTVxkJc4oI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyToVa3YxPOPRFRCSdBsuoEOewFxJmLJwVGBFTkNfgz3JJjJlfn
	7JSmKbbuxjUs6rL6bFqduxN8xv0xH+pprbfj625udhCdkeYJjkdcNEgF6Au+OapBDQg=
X-Gm-Gg: ASbGncvYKBLRKeOIBi9cLiyoPAGcl3sv0fFGZ7cgJVVQZkgNWPJ3gWe+xcp/X38CTc8
	+T6geh+Ro+KXI0QoU8JxIcKKQpYt4h2HVdeaKn7eWOOgPA5X+iR/s8FnpER0mmklyP9L098MHi3
	zQ4B2cl1rGraP1uMynqjOvP0ziZ911OpM1u8QHOgB3wd+vUV2TXeijaThejmqTJrZ0ZstUYgEop
	Bz7YJv7HgDwv6Wl2pd22r4/7wzX586nSbRBGM911af+ZX2dOFalZh0q11eM4QHR6TlUrNtKaFLS
	U0g/Z2Z0Y9XvIZu6DpVHheu1mW/X5N4E2dKO8uenuqzBObPj9AP9JJS2CqX3bGhZs3vSgDjUq+F
	F5wzTUOGLblLUPRRWcLgl4R5U+yJhKWZ31n76+u8B4IZqG5iVzTZZY3c+
X-Google-Smtp-Source: AGHT+IFwr5iuZl/eVovKQjBPYZk6f1WWpY9r1gCyPrcBGzObywlB7xLEKKnGCZPK9BZMiD8MPZYjCg==
X-Received: by 2002:a17:90b:2ecc:b0:329:e3dc:db6c with SMTP id 98e67ed59e1d1-329e3dcdc0bmr2843860a91.23.1756817045065;
        Tue, 02 Sep 2025 05:44:05 -0700 (PDT)
Received: from dragon (104.245.102.166.16clouds.com. [104.245.102.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327cf042f97sm6380318a91.8.2025.09.02.05.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:44:04 -0700 (PDT)
Date: Tue, 2 Sep 2025 20:43:54 +0800
From: Shawn Guo <shawn.gsc@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Stefan Klug <stefan.klug@ideasonboard.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 6/6] arm64: dts: imx8mp: Add pclk clock and second power
 domain for the ISP
Message-ID: <aLbmijMP2f7HXRGV@dragon>
References: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
 <20250616011115.19515-7-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616011115.19515-7-laurent.pinchart@ideasonboard.com>

On Mon, Jun 16, 2025 at 04:11:15AM +0300, Laurent Pinchart wrote:
> The ISP HDR stitching registers are clocked by the pixel clock, which is
> gated by the MIPI_CSI2 power domain. Attempting to access those
> registers with the clock off locks up the system. Fix this by adding the
> pclk clock and the MIPI_CSI2 secondary power domain.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied, thanks!
