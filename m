Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B942046A1
	for <imx@lists.linux.dev>; Wed, 12 Feb 2025 09:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739352072; cv=none; b=DZRv8PwGkzGAktDeKMXlergfbEAJDrRTaaK8Qu5bvAeitRAw3y+OSUYVB94vCoTozhEW/hyNr+E0aKmASIPrvo27BEiohO73iUlllzkJYItYexnGCNAAl72W+D9romaVLuS8m0JLuduSfIpz/zNt/aZFD9prgXAgJOz4XjvGwtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739352072; c=relaxed/simple;
	bh=ZdCk17au8xwp6xQabJ9SUU2OiCQghf6je+QyJ5T8xMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yf0wAm/z2WIyMCH7SqySVI75UcVZkjzb9spCvEo8OkXlYkTe9bkip3wSAHU+7hiNK4vJMtDxBZpWS1c2tm3qcZORDRoiwOeVfYbb+d1Ua8cASI+YlhjSoRgxUN+WQNSrZUPsD+szSE1G+zID38MiKYEdN6uQHZL6fiPhSVmBQCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adAq4GQg; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adAq4GQg"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220c8f38febso387865ad.2
        for <imx@lists.linux.dev>; Wed, 12 Feb 2025 01:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739352070; x=1739956870; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdCk17au8xwp6xQabJ9SUU2OiCQghf6je+QyJ5T8xMY=;
        b=adAq4GQgVRWXolKBlujBumWMEAgqSnT4ZG7U4m/xAuviqZ8xlZa0vqFKwhHBXjz28y
         +6xleqlwvAdmbReiERq2rTaOM5R6sOSnY6kMsQ/FXGIZkN8jNfu1LiRA+FXas9/f1dMw
         weijse7Ctkbu+rfn2W4tX7Ehg+P9UjlxVV/IpPDvPtwNxWtBWGzUgJJMyOTZEm/Va2ix
         9YvQS/j1BoaBLCRGKzWzBzpx5hy/rGP6h/qoSAjFsLnywFkN/gU5GnHzSevW0TrrnZ37
         OLMjOtCKp7IEESeug6A/ItEdHI5LfLB1e99uSvilQ1u6cMeaFJkRFH3oxWVZa3UVOT66
         JwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739352070; x=1739956870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdCk17au8xwp6xQabJ9SUU2OiCQghf6je+QyJ5T8xMY=;
        b=K0/fChVSddgK+wMtEYT4STEXvY19W64Febr1lqjA7CQnEdpDDaHIUOOP2AhUnvdALm
         Wrro64SpQN2e4IzWR4lo8cf35DJ3YfS1nd2+fvAuFE1jZToyk5MIVMNnNF7vMi+RJNez
         aePGKYIpXnPavaP3wxsLm+197SVcX2gdTu2mirCfxjTrnd52+o5KRpDggZbMwnB9Z4Su
         dKqc0Z8XlCknt8+G2nyzn6pKZmxlwZ7priIvnygwR5X0SAEoUNFB6Tuv0px/4YJJKk3A
         IsGLW+HjIuJDct3BxeNz5MY+Cq5boKPxynmVGlZ/5rYHXHQQ1kb39Da9eVG3XDHH1fBN
         eedg==
X-Forwarded-Encrypted: i=1; AJvYcCWJh8wi3LTIfyVD6+qr3oed8hj09BOJmAgGmBH/cb/ZRLOZbb5FNX31F2THvYIil1vYsy0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrdANtMYjjbORDh+NoyqYemip3DlKEBlORmrfpFkioBex2vTR2
	X4CK2bvryZXc1TgUoNmf0ArTPi91CzEu6R8daCmjcZom2IBmCl345Gyf1pULN3EDnjPrCMCGFCo
	zfmgS6Sub2SKLJp2dP8DakP46RzM=
X-Gm-Gg: ASbGncsCon/64eU9D49acQGERfSazsgctF6BL3stsSEwBbgJ5BuFCRwhONuM04qiUbF
	7nQN4zT43IwC5rvmK+OOzor09RSn9JR15TA00qzyWv0dXcVS3uXQR9t8iURNvyPOsgy6AhA==
X-Google-Smtp-Source: AGHT+IFIYrNXPCtCpXpuE+cUBbtKtexwn5rrPm2wY9NepWlkuErIAfcW8lAkQqMlLlKPI7uSLLuikxG2ZiJyOJDuxzY=
X-Received: by 2002:a17:903:2289:b0:215:4d90:4caf with SMTP id
 d9443c01a7336-220bdef0463mr36079195ad.14.1739352070395; Wed, 12 Feb 2025
 01:21:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250211225018.2642-1-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250211225018.2642-1-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 12 Feb 2025 11:22:44 +0200
X-Gm-Features: AWEUYZnMCWedaqcatxfni4tn_ELXHzMLDDkwLubYPADMeAbDeWbIHEv8qAemnDM
Message-ID: <CAEnQRZBEKoXeuUXat+EGfGcYMGKpRW-2RgNQWnKLXSxfKe+oFw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx-common: set sdev->pdata->hw_pdata after
 common is alloc'd
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	imx@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 12:50=E2=80=AFAM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> 'imx_unregister_action' uses 'sdev->pdata->hw_pdata' to fetch the pointer
> to the common data structure. As such, if 'sdev->pdata->hw_pdata' is not
> set before adding 'imx_unregister_action' to the devres list, we risk
> derefrencing a NULL pointer if any of the calls between
> 'devm_add_action_or_reset' and 'sdev->pdata->hw_pdata =3D common' fails.
>
> Set 'sdev->pdata->hw_pdata' to point to 'common' as soon as 'common' is
> allocated.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Fixes: 651e0ed391b1 (" ASoC: SOF: imx: introduce more common
structures and functions")

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
