Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A3132E6BF
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 15:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763134776; cv=none; b=uQjJI6FZy9veRzvQh4ebCazKh/hvjxMhNOvv7Zc059aPH9bgmBMnrMwEbM/PXph55AHB6+Tpopo1G/3u5jNmL0wfU3Wfh8oETSxcVxpAsb+Q+cO9sjeaqwpuXkeIa21cM6UH00aeRLQZHLcIuhS9Nb1vJ1LTTsBlawJHGcuSRT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763134776; c=relaxed/simple;
	bh=RGmra2lFC9P9lNK/GL9ZldkH3tN7480aSv8fVUblrX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mr/yI6JXmq9EnvznK8OJXa/EhLefBl5wNsQOoXunT9TZS/DaUud5tPvEfhQmi5fvj0WhciSVPLGQtZ2SEJznbVyIUfKZAZvcNzOUOsBs7LIrlghkORUG2nLLCQYu6ZnQsfHrlyj4RTa3Fvkgk7mh/sVJlgTZnfYETZ2Q3YuXXK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FOgeI3po; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FOgeI3po"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297ef378069so20953295ad.3
        for <imx@lists.linux.dev>; Fri, 14 Nov 2025 07:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763134774; x=1763739574; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GRAMmO6N0Ms4VG4KlIicRsHqLBZGgrqgz9sU8YWYtnE=;
        b=FOgeI3poDLgFzopqvbMHKPDQuhCToac6GQPBoJ3+w7OAplOTjJfYIm2fgqaQrtZnjA
         ukQ4mn/TN2DQNQpL/ijUD/9YEXCO//qFysWbKjnr0+hOLBgahlRIzqtqD6+PVFhj35fQ
         wQjk5xrtS71qBGCa8802AZvjsYoCUXvR01SOuoAd/TDBvOJKMoVURD0wF32fc7UA9WfC
         XUWfmCyU8GjXJMMOtzqS2VP0r/9qCE12Qt6KE3fowfqxzecbNo8cIli/wwZKFS+/flsZ
         H7J6WWafoyzoMEJ6LhoYzOQKjpvMcGzQm9nw2taenRdPZVWOUGTnuebBpYgiEtvxPf6F
         ZmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763134774; x=1763739574;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRAMmO6N0Ms4VG4KlIicRsHqLBZGgrqgz9sU8YWYtnE=;
        b=p5ewH/jGVF+dB20C4mZIVLglidhNNz5aA16lzcfXHNWYBe37ev//j+MQnqHXZnfdVs
         4ft5RZ3NZuO8Pd3NWfAiB140MLPTHLszQ18zrrScWsuMjQPz0A8p5G4mdXwQdbgKQcLz
         csQPk1a3Sdwnjnok7VaVD2r2vvsTPhN4z55TKI6Ggx19JWOh4PbVsAeYM8pGnnG1IcqE
         b+hyPOnQU2DGc30ZM/hE0RbMiL5L/iyfcNrgvjq609NVF0g+V9J2okmj3yUg9yviWvIo
         sQy4qEq9eBM/8V8EgV8MXP1u4LZgiAw0zSLCDGGr15gxtR1V+Ru4EARrL7B+JuKkh7u7
         vJzw==
X-Forwarded-Encrypted: i=1; AJvYcCUT/4wOGLBYwKFCUjzwz9ZqBZOwYS5ysF7WKFiO2XxdlFF/GNkJFMCL98bTSK0cRZ89Icg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRR6ozioLT8VwnYBWEVyLIyP7bTV3dx6dBiSXMsA64Gzp/vaH4
	3+xCSiSWKjUkNLnTLa4iJnYu59FfG1CcmGAn5VmcRP5Pc4ii5jY3JCfo7jOHCVEwggQ=
X-Gm-Gg: ASbGncvHgdKdaHRjmu+Kj81GPACt4tCp2lQ27Nf6ynaqk7EHMIxUvEje71q69OMySm2
	iRZMLdtX1FCZ/Lk2pmfHY5vemj4v0Ir3u6rz6mG4sCKKkCdpVlqG607xXg7CeTjS84ZMXmijH2u
	0S1HBVMcLQb5j2uJKN0XS7yk7uG2rDCpD+CnaY0qU5DoKBAC0tG4SnrLHg4nUf6gKSbhK02B1UC
	n3cSGmof5DhBlEEcSijk5P8Sb6yJtpkXqkQsOyna1YIV8ZINP/qgsgjxrTFvB/BapsFHJ+c3ie1
	7O1lcdugXLGLBHgAblG4vJaNW5ykF2kolzLUlodJeJug8kbqRpGXHXhmY+lcU5ro4G7WSJNHveF
	/3mnXtkOtX9VonvsqWkdzIHr4eEqzE3Ufc9KBZ517iU5xITZJSqAGWD7lZ3uDJZX59NI15zXA4T
	ii0DsV+9J5C6wyD1AXGY10/dXT
X-Google-Smtp-Source: AGHT+IEKKOcScQRFd2v86pYNutTp+VD4tsfO62nLVd6fmfaJHFBxnvd+5CCmg+FyG8DWccPQTGITTA==
X-Received: by 2002:a17:903:380b:b0:295:6427:87d4 with SMTP id d9443c01a7336-2986a752b52mr34175245ad.50.1763134773922;
        Fri, 14 Nov 2025 07:39:33 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:734d:a808:2eb1:a1ea])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234889sm58702195ad.13.2025.11.14.07.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 07:39:33 -0800 (PST)
Date: Fri, 14 Nov 2025 08:39:30 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, corbet@lwn.net,
	andersson@kernel.org, dan.j.williams@intel.com,
	cedric.xing@intel.com, pasha.tatashin@soleen.com,
	kevin.tian@intel.com, skhawaja@google.com, yesanishhere@gmail.com,
	taimoorzaeem@gmail.com, linux@treblig.org,
	arnaud.pouliquen@foss.st.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	rdunlap@infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/2] Documentation: Fix filenames for remoteproc/rpmsg
Message-ID: <aRdNMtfgftNPVJDU@p14s>
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
 <20251114065746.901649-3-daniel.baluta@nxp.com>
 <aRcEoX9saonpQuvf@archie.me>
 <CAEnQRZC7n127nMaCo+UFnfvKHsRZJTMrmNq4FadfzDJa=1UUnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZC7n127nMaCo+UFnfvKHsRZJTMrmNq4FadfzDJa=1UUnA@mail.gmail.com>

On Fri, Nov 14, 2025 at 01:33:57PM +0200, Daniel Baluta wrote:
> On Fri, Nov 14, 2025 at 12:29 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> >
> > On Fri, Nov 14, 2025 at 08:57:45AM +0200, Daniel Baluta wrote:
> > >    This document describes the rpmsg bus and how to write rpmsg drivers.
> > > -  To learn how to add rpmsg support for new platforms, check out remoteproc.txt
> > > -  (also a resident of Documentation/).
> > > +  To learn how to add rpmsg support for new platforms, check out remoteproc.rst
> > > +  (also a resident of Documentation/driver-api).
> >
> > I think "also a resident of ..." can be dropped, since it's redundant (it's
> > already covered in remoteproc.rst cross-reference which transforms into
> > the link when you build the docs).
> 
> My point here is just to move the patches to a better location without
> any crucial modification.

I agree.

> I can send a follow up patch if this is fine with everyone.
