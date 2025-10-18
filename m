Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C9228031D
	for <imx@lists.linux.dev>; Sat, 18 Oct 2025 04:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760761381; cv=none; b=GvkRrxmD1lOZcgSYChGJ8LwcxFka11G9hNUJle3Pik5QFJr8PmLRXyYYNo4/txrwHmMNwZena3WN3+icD/F9lIM+QzK9S2YljjvGO31NpIKuajVRm/t45cSpKYO92ASCGrGmWCgzM7LjyLIBV1t64f4nPBYJfZJhWi4JJq6z6JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760761381; c=relaxed/simple;
	bh=twucSrQ5gBaSxq5bHh4w/uiMfTGTQSSYFbLCd3U7t1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biQyuU4G2T2IQYQ7CrBQimNVFjmTOYH+k50Rb+1SGnR4ku2mpELhuC157SMYBquVClDjXMiHF1c26/iKS+cOGkvHjZlfbaZ+Tjps+NAn31jxj7noT1YFFfU+BRAn4HOacPsh5E1l+ys50QnIXbsh/qGi32NlHDYdOP7ZNlc8XZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ln4XEOCG; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ln4XEOCG"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-791c287c10dso2171696b3a.1
        for <imx@lists.linux.dev>; Fri, 17 Oct 2025 21:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760761379; x=1761366179; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9sLob+FuMRhc3oCQLkxbSCKuBsggj1HN+/JP5OBcKrA=;
        b=ln4XEOCGDH5yrf+V1sYOs2Slt1EOpHc9oEI4CHtEVf1mjxDly5msRkazUug+kRGcFw
         Khdvnbac9i2zxslQWnmyhzhY3qsMyMJFbnAudqiIefleRCvBLYSTVKxBvdufI2fVNbQT
         QIp2wMhFaOThbJ+t2x1KTpkPHgTHFYKPJUScYjyEvw7iJVClq0LhJx0jHQm6VeuRgop7
         afF4KzVkK5okMZYyr3NPELGVvRQb0znYTWEkbMdCxeJs8/bsRX73XGz340fLiihRoVkX
         8JXKMZhkd8AltjbZqwXLD6aUIpC7q6ZrlbbIILT0fCJfLnWQGju5J1p9b//gHkhb0/sb
         VFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760761379; x=1761366179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sLob+FuMRhc3oCQLkxbSCKuBsggj1HN+/JP5OBcKrA=;
        b=IFOe2fcodfaKeza1Z0TGU/2jRk8zW1B0Auu+MXetOtpdgHC2/KGpV7yxOtnL32ZEJl
         l/IAZ1MGCMbwMrYmfAr0sKIZXK/jg3N4Jbevo9IcYLSUNHpBhzOeUZqYTSV5V64pceFs
         J4sGxsyPF2SBQK0ZaWba5ChCMY/5xP65VP25oI1XV4sd+qXpNPYFuAEKjZq2FmdHYl4b
         jG8he0dkBocBj2VGbPXKcffzRULilTwyq0RWqfpHvgHffn7CObwue4dAKY+ugsObQyOa
         NHMLwDtGI1A5GiXvEyESJc9dbpVdQksF2UL+hzknLYad34Ke/QjAHL3Ki44vaQWZm/0B
         cY5w==
X-Forwarded-Encrypted: i=1; AJvYcCW4qcst9fp0Y1+Tt2IcvHgP2/zhhI+IORHrVRUpdl+DUe0sun2A+0buk51up8pmqZZZwyc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvbWBTCEVrjQ4EQq2DjXFjBSKAdZQsvW/ADCQ20KuF+B/VXLTF
	3ncFKQw9xQyz2rNpeVxPM84b4GRsS2o8cjeoIsWMAt6cKS2rfIqqDJJH
X-Gm-Gg: ASbGnctVvG4C6DZN9sRQoJsHp9xX6BRyri9k39LMHNHNAB8LjkpTw47FDfylNCw3NF+
	skCtb5aw1rSMPLzuo7UOUAIwf2p5d4F7ycGfULPqUJ4//09J/Q+ouyzBNKOrihE3to5tP7kXZLg
	Cc6wAy4KEeNPu3XpXTAOAL8mSY7nNw8rWpL1fTYbXSEi3KaGs/nbeSPSyStwQOZtLN7PqcqgR0M
	A8ogx+DKqUjHoGlmMx+H5Mwed+NkJ169ym9+dGTLfFEzKP8EvIOmjyEqvoZYa9ufWGKwyYeC5fn
	vlVBgXIXInmbZ80qzTKBuRlM2jtD4aQsU2mkw4nwwsTPGaf7LpaF4BCxrKRWZiRjiM3Udo0zzn9
	lg99aleHGrLKCo0MG/42WrIgiSt5RPxynw0oyDUsfIJ3m0lyjytTHCIuJDpJ4scyp1uqwYB76MD
	neyMwwU5qYIJ7gIvUymO+vBFzruSsrifl9XL9aioNrn5LiQMfcDeY=
X-Google-Smtp-Source: AGHT+IEhKFhi3mFcny1EeYAjFFvibCPRFlOFAaD2YdcMmlpvQjgeW53Ajd4FqG8YZ9mvVIB5YeafcQ==
X-Received: by 2002:a05:6a00:4288:b0:7a2:2100:1d4b with SMTP id d2e1a72fcca58-7a221001d8cmr7669202b3a.14.1760761378534;
        Fri, 17 Oct 2025 21:22:58 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5e2d:c6df:afce:809b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff34e98sm1318508b3a.26.2025.10.17.21.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 21:22:58 -0700 (PDT)
Date: Fri, 17 Oct 2025 21:22:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 2/2] dt-bindings: touchscreen: move ar1021.txt to
 trivial-touch.yaml
Message-ID: <jxtqhq7u5obj6em7p6hnzqjkmr7svomeptqy5bgvmqr75pbbnq@d5didfx4qqvl>
References: <20250926184720.391335-1-Frank.Li@nxp.com>
 <20250926184720.391335-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926184720.391335-2-Frank.Li@nxp.com>

On Fri, Sep 26, 2025 at 02:47:12PM -0400, Frank Li wrote:
> ar1021 have only reg and interrupts property beside touch common
> properties. So move context of ar1021.txt into trivial-touch.yaml.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry
