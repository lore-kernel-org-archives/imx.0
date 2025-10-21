Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B31E34F248
	for <imx@lists.linux.dev>; Tue, 21 Oct 2025 18:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761069887; cv=none; b=uKELhs45DW9BbXMWStMAmQhTZH4EaiFZP9F5NbsEeXL8E9LfHVccn/woZp84xLW9XkWIE++AX5epUtgrMz/RvdeYhcX6owa7gWP9Q2f/ts5zFTqbSLid6GKCIlgWUlzuBKNjXp1y24EZpo0sUsVSeaNgEE78EBbnDIE5eh4+xiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761069887; c=relaxed/simple;
	bh=jhCcagVML83e1HP4dBy858O3DExVw2BUwBiMlSzW8y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONNR7qKjFgeTwHb2m0Au2butWxviURachh37SZJ9uAy0Jg6/2GUT95dWXTaIYBzFp263a9XHBzZfqhjGrxDqA2KK/fwV75dvh2MbZbT4uih2UdSze7bGj4ZqyjqIXmDpmuZhin1h+BeJVK4ooDV5/zHl01BkRmCo8pmCcrI7UK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0BSznI4; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0BSznI4"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b679450ecb6so4383186a12.2
        for <imx@lists.linux.dev>; Tue, 21 Oct 2025 11:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761069885; x=1761674685; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2QNqcW6c5+Npg9ifV37H2IqLMfiz3SDiycbkwes6nzA=;
        b=O0BSznI4nUsgzpEDI41sfGAViMrKuTnCZ5i+8F735X9wrGV+SK5wZIirfnDNEPGgwt
         xZUP75OfFzmFI3R7VWR93zx/oyPxIVPn0/IwKCRiMfrfGSxXRj7IRU+xEHhoBT78SITS
         yUPAL2Bc3iX6MSdTm/Fbvu9xUoXTOHZG6j6fGFjGp/nv4aBN3IdqCdDACyV8RvEX3RcR
         Mu5RJbvw5YBvyE/Jed/UEDIWi40szOFxNhI38rCrUSfBmdYQuUuH4ARhdXKqTqpV9N4F
         4I0YB799mRF/UgDBnKNufrSJ8wghCtb3+jn2bn+cTYuEXgaFWb6RPGJ/QGFnDRuge8kL
         MYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761069885; x=1761674685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QNqcW6c5+Npg9ifV37H2IqLMfiz3SDiycbkwes6nzA=;
        b=TPldS0Y6MWm8gjuS+6PqoC6Bc8xZo9FU6JxMparFfsis82Zt6gFje8UzaQ7m8TdxZ8
         LQzrCLdKnTX+R9VOkT/iqreHbRhyhOaRQhmfPJjpa7i0JBdfjiCx5ZHXYk7ysedgI5K2
         xSK4FKwO4mz6u6bPfbMeyArc7mExVnytUzo1kZ3K1+Rnymp6olBTBcBUoxVIXFs8Mvx/
         v2vmgGayB7ytWK0aytLiWhFwOi3vU3MIB2Yzx4pMTP5si/YelXKwmsgvNF1r+rqHwFN6
         B5UZYgaQIsyXLIzP3HJP3t9a299TWIJQUbgWNi5BWdErcmuyW4gPEx+rBhzW317cTHF/
         1NKg==
X-Forwarded-Encrypted: i=1; AJvYcCWRcls9tFqtMYgYlwhUcxtTEjdRODL0qs7U6uD0GhUFYNwyYdWa0sk3sttYDmg9ytcsD0Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBCd4vEIcJ20o9g/HsBz84SIPfiuLH3TNfprQ189zMkd6cfJRu
	Cb4EJgkQQ5+M05jFBJuVBhfG0kPTuV/OxhYMuRYx3mXm1ed6MDh8Hd/i
X-Gm-Gg: ASbGnctOeVPYlIuy9j6vY6RukAWl0iv2pG91CXc9N1RJrRFomkOCB98lhd8Ip1j0IQU
	sdf6qBuVRrkXZIP7olhwzujFUeemJJOqT01KJlwN+5jXo/ps+qsHJGc3d417faeSVjAHVwwVXlv
	WqAVwWi12SfJYaUea3N7KqmGAOqRSEq2c4v2n3BJAzm0VITHxfKc3jAfciBE0wZFFUrfMZVCidP
	Q+nAu10H6CGEalnXeJluBYgvJql4P7LTpuVMesrPxobpufnZ/mkdHB5efgipqFvqoPlmsdIavcI
	RyKriOr1LU4ZqtlXSouSJXalk/IL2pAPFsXyzFg7Lfo5nVxjaCswb1zgyRMI8VihVleNoyDZCC+
	969NHcL/2jmaunzVV9QfbMOSO8Lb7T3FzxWs6LM93v1LOKrrsfMnoE0gXZlpmaXgiCImPWT7MdY
	tPHIoKyUJWB1Xaxdp8ppB4xB4XfP0sZ+b2RZ6DBqtVj3n5NPjgOCg=
X-Google-Smtp-Source: AGHT+IFHxNyo0lIoDCYjMil0Lo93Z0LIGv1u7aWlc4Ygd62ZjbFDY0Z4GIqoMlga/4TZ2FuxfJzz1A==
X-Received: by 2002:a17:902:e549:b0:28e:756c:707e with SMTP id d9443c01a7336-290caf846e1mr241889355ad.33.1761069885196;
        Tue, 21 Oct 2025 11:04:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bf44:8af2:4f63:3654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fcc2bcsm115555635ad.33.2025.10.21.11.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:04:44 -0700 (PDT)
Date: Tue, 21 Oct 2025 11:04:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v3 1/2] dt-bindings: touchscreen: rename
 maxim,max11801.yaml to trivial-touch.yaml
Message-ID: <opdzievwmkkos5wyohrl3gydfmllcrw35bhzqa2gfi4kj3573j@ghlb4nndm6id>
References: <20251002164413.1112136-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002164413.1112136-1-Frank.Li@nxp.com>

Hi Frank,

On Thu, Oct 02, 2025 at 12:44:04PM -0400, Frank Li wrote:
> Rename maxim,max11801.yaml to trivial-touch.yaml for simple i2c touch
> controller with one interrupt and common touch properties.
> 
> Add optional reset-gpios and wakeup-source properties.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - add wakeup-source and reset-gpios optional properties

Sorry I already applied v2. Could you please rebase on top of the
linux-next (or my next branch)?

Thanks.

-- 
Dmitry
