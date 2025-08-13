Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0F42D23AD
	for <imx@lists.linux.dev>; Wed, 13 Aug 2025 21:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755121647; cv=none; b=fOLevgDAfhQ5w24HLa3pDRONCyfXkApayHw0pZxQ4Edz0lvsQz+kYK0d90F8zE9ClqW4vlps19UvXdAAtcNaE7aTaLuwMdSDE5WwBh0qQyhfo+/5Z1lqlxUkL0tUeL+PKfCT8Rkv4NhnQgwwKQUnqRW+4W1JJiobvNTJbIE1PLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755121647; c=relaxed/simple;
	bh=1VQIRUsprnF3Mig8oiLKRbOl5bzLLP0G72cXjJYWiyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaYRoJXTbmb5H6vB3gnFt183FJN+9anpqbCboSuv4AqwoLexDSp/sdmzah0llSmX20lBFI0N9Uo55bqXrkblzxvpvZOETD15SmM/aJ/rLJxfseTd4Fwe9yqbV6mm+HFjALuTfP6ylNdNPgwr5yryZwoPGpahjFOloNvV9sWO6mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFRq5Lg7; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFRq5Lg7"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4717330f9eso148845a12.1
        for <imx@lists.linux.dev>; Wed, 13 Aug 2025 14:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755121645; x=1755726445; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jONifV3SAqgTpD6n3pEouquJmVfQbYGkPJ7FQpi+OiA=;
        b=ZFRq5Lg79IzZiO9n27IbS+dJueiM4yUDubQlVX33kuj/+IMR124WAQQ87tpL6Q6MQb
         RRvMmAIumvBQjGMUNC+V3DbikIsvHwoLHzBcNY1tL4PPGBLmGeBMT06jGO4lE8FnK/0m
         ycMClA7OP0G0+6nZ5dMnt0DjOYWvvFj8bs6tzx+jpv7ccIAjuo1H6q6yd+Dj0z1z4HTm
         +CWv5BQ5Hnsm0D4RdSGaCX+jYLQeMU+khd/PP/+sjN9IMBydZ0scBCaJ+ul3RWlKnyEU
         q7nK0OP6FwUthsvRKS3u8CNuHxdLxBJtKbJfjRUBX5DCO/pv/HjEurmuVTQaZvmLAtuB
         g5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755121645; x=1755726445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jONifV3SAqgTpD6n3pEouquJmVfQbYGkPJ7FQpi+OiA=;
        b=iTJ8zlPjVKjuYf/fLvtMqnO8jYifZCYcGhO6eqZUFNh/0W9KE/Okg7VUao8zIp5qYL
         rY/6BJ3YhqOzicH3YnMDprIxX91BHQhJnLEJnTm175eCRwASkpWpTO93zEtZDEPDRrDU
         Va2B3kQzltHUy5f/aNXe7c57vF5sRMujBy+QtKJxsqdkzsOkrBWjksTP17lhp3leXh8M
         IBz6gnSQgF50bKNUBJ+HtgizuiO+//vV6KRQgKPkXbkmZxUUdqLVH3CKTkY9MnrfSHym
         DxQatdExsQZjPPcoILwivS5ZeMNBAJmTBgyFjuTFLpOd1Eqi5jRxyJFmhszceofK+RwR
         Cc7w==
X-Forwarded-Encrypted: i=1; AJvYcCUAHWrMbxJGhIksGTAp0OTF5PKa1Elwv0WSGdhVcxU08UYBxx5Jic/eDFxt70RLpEhdNZ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjSdbKmbQc8XjC5FxmXdkywElZ0kdPflXkJglY07Uo54XTRXFg
	/hfHqdlkPX+tC4EmL8zpbIQ3qzLUCNxOfH11drMw1ytFS0DMVKtKSHSwf/wxiA==
X-Gm-Gg: ASbGncuZrrIoRj2kL0L2ih79juXbw5ttvfCEZaqzF4FO3X9AV1o7kSVGcvGphsahynw
	zMhP/yN0QFS7+E0BIzSWUJYpf8S9yBfXwPjNNT54EIsGWK2hpgCEPLEZ7I5+xv+KDMeBJd0xlv7
	4aCBaLZDoA7/B9HuRb3FuDrzu8Kf6pXOzqTnSoGTSivPASB8vWOvmKR3t/i/A2y3VSQIfzyaRW/
	C8gRZe4mXu3qKRYb6rxERaNRGASLb/boobknEp8s21a+aiVQDAxklOpR4BMn1AR5lbLJHWOqd5s
	2/9qXVQ1cLruS4sY/6Ot/6UV0YfcjEOkdOu2/qJg/bHQvRDYhZdx2vtaVl3Y3uqopPdLSTVxPA7
	9LWDiOit0fkJZk8yuLdUH0lI2mtLLZ7HT8w==
X-Google-Smtp-Source: AGHT+IFnG1VfjTfFzYy9SU6px68SStWgfbepA09Klycfgu1ndr7pAZJLu+JzXbLn9aZDNRQzy9oRlQ==
X-Received: by 2002:a17:90b:39c7:b0:320:ff84:ceb5 with SMTP id 98e67ed59e1d1-32327a634e5mr1308738a91.16.1755121645110;
        Wed, 13 Aug 2025 14:47:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:89af:72ea:c356:f3f0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323257c27absm1022898a91.27.2025.08.13.14.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 14:47:24 -0700 (PDT)
Date: Wed, 13 Aug 2025 14:47:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/21] Input: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <3hjodmfpiuh3xeiwugtpfs2sqoinb2toir2v2rchhv3nd3wdwj@2uiynsb5bzlt>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813161517.4746-7-wsa+renesas@sang-engineering.com>

On Wed, Aug 13, 2025 at 06:14:52PM +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied, thank you.

-- 
Dmitry
