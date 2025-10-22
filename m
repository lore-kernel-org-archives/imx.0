Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C092F83C9
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 20:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761164775; cv=none; b=Qtrz2Wj6QfFoLT3z0FvsF9GGAJHDyz0h0SDpfmzeWUTuuWLFqe3QT52h6hM0ruD3Joz3KvGPZRLx+KZGhRcSKmy74pjVo3whlT/n7KqJKinrOPhYTFcSi3td/XP8NxTqdBQ4JYlimIoPAaob7jHr9nLE7oI0Se3kRGOvbXi7/bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761164775; c=relaxed/simple;
	bh=UsE2MC6YhiU2H2YxopFmG19GYWLjhkDN5teQLVlPj+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RemAUIHF601Ghp170ymjh+YxRjEJtxScQkuN47r2OxkRPr/6Uc2f2yvOYpr9y/6+tuqTViW8VGz4uHGd0MqDNPLlHaMZxwjD+gHG6e8QCo9+OL+TN68P4i+ImmUNfRyrB3RoK85EcfJdX3hJM/tV7NV5dMcLCeomnKrRkZ2EO/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+hXUjzH; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+hXUjzH"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-793021f348fso53710b3a.1
        for <imx@lists.linux.dev>; Wed, 22 Oct 2025 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761164773; x=1761769573; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T8eeYBeVEIY6XvODE4oNhMEO0a9ohRRG70mMGclTsoo=;
        b=T+hXUjzHkOfZP0YKO6cv9WXKdDu1nIK9MP/0u/sgBnhQHBe2cfxpV8d5RnGLKhRB8o
         FYqNAiYppt7nto5Y56va/wKmUudWn+q33pBS50C1jRS2pV2+q1r+YmUUYTftRMtU/PpD
         FHQl7/wkSPSzlZd38iMNFkQLxFRilxCYQm4VLLvQiNS1SlTp2vjoOmLV3estgmfS5zDb
         ZoYR9LKpJkhDpasOun7tev2ku01zvAPPNyIn2UixJJ6UXFzRY+4Rx0NOl1OaWulGhe6o
         cqU6+6JwF/s3LGKgGDZKWJ1U/f+po0vu8V45VEpJPKS3M8o1h5gbhIi3TKy4QuLyhK3h
         dpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761164773; x=1761769573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8eeYBeVEIY6XvODE4oNhMEO0a9ohRRG70mMGclTsoo=;
        b=GAvvx7eMDwcgqHkzCWq74DmLUFnBsqP3/tD5gvmb9GDACwWRDINu4TaIslXb6gmti2
         xNdNh7YOsHKM3JXsfofUTE7eQHrL4i5Yyaq9Wi8GhtszKC+8DoQIyvIDSO1drwYXy6EP
         jTcVIbgdqmh362wv5+ehzfi0lQP7O8JH5S/cv6xabWwrpCGqL1kX6tUJXSOYur/W0q0Z
         +eI9urMP/+hJDPU+d5PPcxTnHo//ccksc8yjGPEuMD7VtHuvLEgSG1zmUxmtCbQq2Wf+
         jgcDz6kFBn7ToKibDT0WuFc/hpGk3mTiGSOtv0GledhW2AxXOApAzzvjs8sHcG/feWX1
         yalg==
X-Forwarded-Encrypted: i=1; AJvYcCXtKk+KgeVpmAW1IW1jlY6Iwomca+n99m37MuV/WxQfOdOoMVb0rC7869cba+OP/Ubbfc8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRSRCBzTfXSnAJJ/W+el6VVtHYQW0flAgkTQhXMzPin7APkcT9
	HJk3jaRdV+4+HcefHNCIuK7/nVyH387rnRz7dmP1NzvV2QLH0iH/Je/P
X-Gm-Gg: ASbGncvf+o5g+t95CVnT4MYc6S3uvq2TDase5bSo4v3KI4prS0bG6T7YKaS2YgonE64
	RARpNtL5f8cZBERHZgsHHeKVWkKsqzTtFJtWMtvmN6dMBHeY6FeVLR16tkahbTzqGEDLjUEpKY+
	z3KsrHUekqqc0ZXB+1XMMVrplSDQdk7mxEFSFKQO6GDd00joYyrCbtkKza0lYuXR5H27xHoAQ6b
	hZjhIE4hPjj5d/ZNSI7sxMj647UBJKyqW6HNtJDenb60dt6tlYdkoI+MnjF2EiYnOntJ142WzYX
	TK0wL36I8v+ysYRjAQgQYi4IccfvVV+Cl74V4C0gS7U82POZ/oWnuIJ+0pbVwAgpuJSTnBOA7yF
	NpQicOrhlZEU4BRVXiA6nEp1zFD3RCb5JDtd9soypomD5/QGdZUPUl1a3yrdwGmkKln+xB+vaVu
	oGWuz6FkQbVjGRhU8Ztl3azS9v0pmAviOyDJA736us8HgM1fFIgw==
X-Google-Smtp-Source: AGHT+IFDRCcByl//79aXbsGB2yKo3kBq184UaG8KGH4X6om7TJOgKw+yz9TH2hch3mYKqlgj9G617w==
X-Received: by 2002:a05:6a20:72a3:b0:331:e662:c973 with SMTP id adf61e73a8af0-334a8607001mr29327304637.32.1761164773019;
        Wed, 22 Oct 2025 13:26:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:53a9:459c:bdc:6273])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a619d5sm123324b3a.1.2025.10.22.13.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 13:26:12 -0700 (PDT)
Date: Wed, 22 Oct 2025 13:26:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v4 1/2] dt-bindings: touchscreen: trivial-touch: add
 reset-gpios and wakeup-source
Message-ID: <dp2qoiiigb3zv3w2osyloiugasgypbgj6lcnikcekqpq2vb7wz@q5qpzmlfei2i>
References: <20251021201924.2881098-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021201924.2881098-1-Frank.Li@nxp.com>

On Tue, Oct 21, 2025 at 04:19:17PM -0400, Frank Li wrote:
> Add optional reset-gpios and wakeup-source properties.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry
