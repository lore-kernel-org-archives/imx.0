Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BFB1B95B
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 18:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751393595; cv=none; b=lx0I8Gf16/aiqyxcdq0HHiRtlWfXGcAnNVgBHkOOikh5NBXjWPhedqFzGEysAKL6oiCU1Httd3YJDbsH1gi0YxSJUJfjC24Aj09lrpad7r87k4qjtPlKrvzK8VgvJ73QYfEMJx2YLh/9iOmtuZW/HO1+ISp/cixOlu5wqbts4GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751393595; c=relaxed/simple;
	bh=eAu0MRSHV6xH4249WU3u1VjZk+3a4KJwctP9GEQDFLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdehC54EwMk0qctLfqcT7C2chDgfaRX+zz8YCcHc6HHHgek62mZDb5Gc05lBhOqeAI07yFEU9IRPTTCdqxf1zEBHEF/4GAd3aht/ttToBzZVL3EVz2YlzxkY2L+iW32hl7rrV9+lieAlIgzlKmF/9u9qmbkLvieod/sh2UQnDUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkVujIhv; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkVujIhv"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23aeac7d77aso31775385ad.3
        for <imx@lists.linux.dev>; Tue, 01 Jul 2025 11:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751393593; x=1751998393; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nepb3zOB889c16aJ25u0uXLI1bBeotorI3Pi5r9+cUo=;
        b=gkVujIhv3MxwjdSvJDvY/k7jSjMLhKF3NG+fdEu2PyeOSnvknOcORxtcA7U6kaYnIL
         +PGEC8bLnYyISKBN5vp60P7eg2FatRV5kZpChbPU996LSw3gSHsiCUcjs1S4yVppjCLF
         i32ekSKe5MF+mbSq71e3VT7Qn9Jajf+WyJEAbJkMqp7qEQMQwZpd3xD1ALSbHF4vqyOA
         jJUA/Bmapcdz+ijYFj56o+pU+KEcpKIx0SSiJqlPGyMKz1FLJGB5KplKtG006Z5gH15B
         bAahaRgLUo4bzoqzVN1OPSpit5/nrcyb6uR0UMhR6rqpK3K4rvSBEwe/cJbVfewkcUQa
         jYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393593; x=1751998393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nepb3zOB889c16aJ25u0uXLI1bBeotorI3Pi5r9+cUo=;
        b=LPYEj8BC9Ikkkegtx4Coe6MyBhC1KI/46bIwshnpSCSyuCegVhtUzK1Cg29QkJvj7H
         yOOeEGdfKqBvWf0e0+WyVvum2LePIenPS/etEsaEI8ZmR58OZlLFTVsf9V1G/MnmOAnE
         9gAoPJm9EwlKddLMld7T5L4mQazD8FzbrpPI/0BxWfd7AnRt0w/4OmcQMj50rGzCuDIr
         +nkXEIA1WdLocS+Vif3N/65WZguwBTAOlGOPo5qjML1E0UVNe44DDsUpkTdqJtNhPFEz
         tBaisl67sBxKAhW0dNgbzZGSyj/JUigjQSLp8r+EerzH93nWSLb2sz5t7nlXauwm9zvV
         cdUA==
X-Forwarded-Encrypted: i=1; AJvYcCVL0M4qgdBtQFv/JX2c3HVwBjcZqAgPJStVzJA5Skj+zSfVgSj9TIXW+k1WHNjipQRxzjE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8oDCyJ6rWCjZmQN/rrG6Oi3feecD2AdjDUVVnp37LlYCNbIUp
	qWIDoXDIT7PcjiCxwv4pbjxAgYZYtNHbeb/F+DbsKqSclbQSIfStLVBZ
X-Gm-Gg: ASbGncvBFg18JNmphz2D5u7u+2545yJZodbL3ndFGIweBHO9VHr0DwFC0tHkRwlbWAW
	76JoBv4tMgJtrEPF4EGwLRFaUOvFncl3ogC1ho/dddT+UsC1Pst/NahxyLm4jARPRp5jvET1Lzd
	N/spmceouJKTmsFjNPZpXzi0uHw2soPLi1tPYI1ydy/Rk2ARal7StGUqa8o0JodVZy9GZE+aAU2
	1wC3Q5p7/pAUBoSjNdhh/RYYgHiqkpT3lvPcrjamoeflMueh0HjfDf59QopLvagNEDRKo1ZDOny
	PKLrZfZRS6foMeQLiv0PoX5OCFVegqUrm/gfFtX0TyK5tK++5hSMhw1cOlNkGa8=
X-Google-Smtp-Source: AGHT+IGAdFjKL0rEV/0i5/agWfz3gy3C3R3l4wEiE5tiTp8xVYfcABnycX6766pzilb4G+WLEWj9pA==
X-Received: by 2002:a17:903:244c:b0:224:910:23f6 with SMTP id d9443c01a7336-23ac463e8d8mr287205225ad.45.1751393592975;
        Tue, 01 Jul 2025 11:13:12 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7bb0:b5bc:35bb:1cb4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b85efsm109583475ad.185.2025.07.01.11.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:13:12 -0700 (PDT)
Date: Tue, 1 Jul 2025 11:13:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert tsc2007.txt
 to yaml format
Message-ID: <ooyp7e6gubzqxavo7aadie7xgo4qi37uarw72hkhbbbolno6ht@y6fve3n3rcru>
References: <20250529193241.793678-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529193241.793678-1-Frank.Li@nxp.com>

On Thu, May 29, 2025 at 03:32:35PM -0400, Frank Li wrote:
> Convert tsc2007.txt to yaml format.
> 
> Additional changes:
> - add pendown-gpio property to match existed dts.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry
