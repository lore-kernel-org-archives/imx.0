Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198D42B2CF
	for <imx@lists.linux.dev>; Wed,  8 Jan 2025 14:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736346369; cv=none; b=kSMMNp72SbsroFyQUy7/0z5+qud9BX9xl36H34+RsicOtTBg16BHvWoSebnfIsOHqds+sGs+F2ZE2ZeQvklGGr26TJ0yWL8hDAL9urTkyqo2KsKDcb9jG2Vn4jOrdFidhtHTdddLzv242/3g4afL4u25I7h1gCmOHIGeofPogY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736346369; c=relaxed/simple;
	bh=VzRkQFsbsZb3prYdm8IYnpC6IOEvvGL2fTo7OIg3jSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QlqYf7xwt1/GZqrzdqKqso+ytTswFeYsDDaY3JbfeuIV0VKoHys09Prqb1ECQfwb9v4kO0e4bKVcjEDX1HRQe2jG3kEVYevJkP9ED1gDDbUVebVnkpXgDDB21DBe6fEuw3AkMfdfRw0RBUnUq+QE3ihulaZ8mEpgd44rsqjCQ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldXwhUrh; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldXwhUrh"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-540215984f0so17341438e87.1
        for <imx@lists.linux.dev>; Wed, 08 Jan 2025 06:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736346366; x=1736951166; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzRkQFsbsZb3prYdm8IYnpC6IOEvvGL2fTo7OIg3jSI=;
        b=ldXwhUrhMqbTzz65Ef3sgseDRehUVHe/L4wX68NH8F4m5tlKsFmS/J8iPEW9OpgN6o
         39Kqusxt6sQpqgbzqrmxK83oSfbXIc0Z9ur3nXUMCMJSGNRPYfLxd1/PW62YtLIm0Y0O
         QYo3uw4VDVuCMat331LB52UMYacaSvIMwgAU/PlUwPGN40d2eMWIx817aafQXWZ6N8/0
         dgQ/W7DezhOzxLpXquVO7hniuEGmSagYDr/ONNMFPMaD+OdkjqLM8bN8BQ783UbeHLEI
         0VaHnCVkfOvE5AOI4ATiWlvbAxPgiWZhPvo7Fro/FiJJFyi5EwXFTvnbdOTUS4ctmcUI
         8pHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346366; x=1736951166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzRkQFsbsZb3prYdm8IYnpC6IOEvvGL2fTo7OIg3jSI=;
        b=rwkgOW9WGSLxe6ghZ6BT8lVowgcGyRZT1QNa7CmNKnwCA29wwByejqb3qBgaPUuwdm
         Hd4ewygmVdpmqO7utzuLfLL2kFJhbgoAV7gCf07I3UrAXTa75vFUbvDgEd1XRvItlI3b
         H9Jvj0xPNNtpuclknpS8piKRGne4tCs1U66KgDEqQcAZY2v2ARI8Y8Zr9pCzZRpyz/BF
         AUGRWGJsQ6jGhruwrzcZmDqElg9AiLFj/jjoEtd4Z9uSpcpUoKZwIjKPUq2c1msLYruV
         vm3w1kmsgJ9j8KfNX166WwJQhl9tSpJMFcGHpV8WrKSeXhdpDNXFvK1Yl1t+GJyYnYNN
         fVuw==
X-Forwarded-Encrypted: i=1; AJvYcCUCwljQjTVYlQuplNtPFlmQpBFBJT938jW5Z7PCWj+ewkAkBXZYdf1hlfnLDgpt5pUXY8k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdeUtHehNOYOV5PsL4nxz3iszccj7jLrepZSVcrmCpFbiaVP6c
	LHvL4+5UfXc4/seIBwHC+x1YC6FhAxitTaEgradtFyohg8QFPy5qJn5vo9N54bM/YRRzge/VmVR
	aBz4rUk6Hrj1vStEMD8PI/YzRARY=
X-Gm-Gg: ASbGncst5wdc9kJqfOsG4nH6FsUF378hPND+35fcx2AVLo+d5z8dhtsUqpTYz45QpH0
	DnLD6d16QAPs2t3G8QdaYBS6xuryQxkw0315Z1FkLqt+acqvvo4+LNopRlMQCXx1CNS4grA==
X-Google-Smtp-Source: AGHT+IGS3A8h0Q/PUkaHrm1SeFvYbUscGOt6bkTAr2NyzolQMBSyfrUMesJ48vgLAB/IZNBnRthccsMB5/EPlNVzUcc=
X-Received: by 2002:a05:6512:1150:b0:542:2166:44cb with SMTP id
 2adb3069b0e04-54284815b35mr845905e87.35.1736346365946; Wed, 08 Jan 2025
 06:26:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
 <20250107094943.518474-3-alexander.stein@ew.tq-group.com> <173629198495.2036683.9877314471091548361.robh@kernel.org>
In-Reply-To: <173629198495.2036683.9877314471091548361.robh@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 8 Jan 2025 11:25:54 -0300
X-Gm-Features: AbW1kvYHWbk5Czj-Ab9dHoICLA67HONxWPXgJEt2PMFBPH7OeOl5M6o3MpfGq30
Message-ID: <CAOMZO5DeGn1_i60r7Km40D13f+B+bTk8DndNEJVq4h6HZnnpYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: samsung,mipi-dsim: Add imx7d specific compatible
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, imx@lists.linux.dev, 
	Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 8:21=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:

> Fabio is clearly confused, and I prefer this patch over his. As
> it is probably past the drm-misc cutoff, I applied it to DT tree.

You are right. I am sorry for the confusion.
