Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD882765F8
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 05:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756359986; cv=none; b=RoNOkBP/rLuoky0N2vl6uxuB0hDcYBQ92/idWsutRmRMKthkw2ORY87J78PKjaS85kAeMiiW6+ZD1flGwVw8jdhSKyWSaNiXZYrembSRkSRoafbpM3b2xEHA6DCgo4SxdhCTyHrpzmyPhiA2qnPmJd5+ARn7gz6DT3Ely6mpT/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756359986; c=relaxed/simple;
	bh=i6L+f3exnFOVhxuWsM4teMlEODpI+rzw0Jw85ZTvtIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opHgTyqlwtUhdDvEIuqblgVl2X1Sto+YC+ktKXW66eGvo+sOqB6MPyxop0DmmKzplquixo3yRpBY1aPKaveQjTXt5X/yu8LtaqtzQTlJ32Jv5P/UPui9kfgNWeexE3IY88HXKOqWB6pdlp64H8r31g4Evt4u/nMRRpeQfFKYI9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jp41eMvA; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jp41eMvA"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77201f3d389so662692b3a.2
        for <imx@lists.linux.dev>; Wed, 27 Aug 2025 22:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756359983; x=1756964783; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JrIDBpuM+wIKseLTnowhk8eTE9B0XZjCQe+CxB8rd+o=;
        b=Jp41eMvAekXcPpTvfGgVU5Ve2WPmdJmhiGVUscRjMgDYV6hqalganIdU3LM2Er9Obq
         bSEBMMVlrBWrSKIqsMc0Bd3zY4QIGEclOJRoX94BseBtL6sTJaN3Pyr5iVQyh2WOOZQ7
         VUydSI3WS8CrVnV1tfq8H7j0ga9nbx3IpntY2NjYu/aO4DR8UpbHF174adk6i6IDOFq1
         bZ20cQbVOFKydMenHYmdRclbJRlZLT04btsh55W1svsC3YNd83h6Ttu91KipaCdkv6k6
         QMpM5voBZlTis7Y5awv6IWuun2WnT0ykIEFh0VjLEKK6uAOVAsZ1vS3e7s+oc5H/WGTJ
         l4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756359983; x=1756964783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrIDBpuM+wIKseLTnowhk8eTE9B0XZjCQe+CxB8rd+o=;
        b=e2lMe7s/WoEDBEIgUtFSXeu7RfjFhL/e0OquZp+imD4juIvq/nrjO3M7BEwOqm79I4
         27EJa4cW6fehTqizjmNStRiaAzSh7ch4f6ybi1HWuVEkCSbN7BQOs8FlfIZXEEz2NeCQ
         GSW4iFRZJP9JbsYUQF5m9Uj+KnPuD97nNZZslqDXb1RayYpm3ALD5k41CjdeTA63w6sE
         qp2Mb3fRuJwj93OQUX4TpE9wz5ZEdCLhk4HCx113gQRQI+MRmjZyYi0YKOtajaPEaGmS
         //cNPJVCZOCpDDTYApOqWL2Yz14HKA+5lVBbO/jK/U4YrRmITtB9/pHro5sUC7/qASU7
         2/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHvr7tVOcYLXwteghAEB3LrYNpLl2wrhtlaDC5cCHFtC/pEM/jNcfuRHbNrXpzmKfgTtU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJU7ZcrCXw4uT3VoXPaZX0zjBttDkejGS0rw25qSobxZGS3yfu
	o0EXriLZfrVMbigEB3yGSIHX1nAOYTUo9X8I69zzWB61gr2liiupKbJXoGzQp1mJzHk=
X-Gm-Gg: ASbGncs73JPlglDJ8JIYd5fR7DVa4T1W3unCebJBFAsSCrkWTEBEvw4ZQuiHiKr59mf
	G+h5+ES4i5I/v/OL2BR4TMFzEHEoTBKhX4RE69xYiOAoaJqIH9CX+jMoxd4xYkXw9bNfRfkNeUg
	BiofOvE2ifVZDIIdVED9LaC0LjyCNBkcRhK2GjUiiGs6ds+o1y5MT4EjoUFPM873Wou2//f48sg
	FY9UzYpEHEzS1eWpbtTYflA10QaLSE35KwNn3TWSf9UguLS3Y6i/rSh/+pEUezcMZpvBauLLKqQ
	mOzKXNAMb0AZRFnm0/KCJ9zGo6ulYYp4EfOvNCgGXYPx6wsBcWIkCOWBo/JKK6OjKw9dDxOolr0
	FveveReiB8tEPjaNUM+0jSxHM
X-Google-Smtp-Source: AGHT+IFfuu4OZWLK4Ect5V8qcKWdtQ9AvKTAwNSmE5IY/JmFZqua6II8FJDl1UVaUxNnVGH1wfuJAA==
X-Received: by 2002:a05:6a20:2448:b0:240:2421:b912 with SMTP id adf61e73a8af0-24340d17030mr33915391637.37.1756359982962;
        Wed, 27 Aug 2025 22:46:22 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4c1b2f5a3csm8873232a12.4.2025.08.27.22.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 22:46:22 -0700 (PDT)
Date: Thu, 28 Aug 2025 11:16:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:CPU FREQUENCY SCALING FRAMEWORK" <linux-pm@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: cpufreq-dt: Remove redundant
 cpufreq-dt.txt
Message-ID: <20250828054620.u6gbjevidlnv32cl@vireshk-i7>
References: <20250827204401.87942-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827204401.87942-1-Frank.Li@nxp.com>

On 27-08-25, 16:44, Frank Li wrote:
> The information is already documented in
> Documentation/devicetree/bindings/arm/cpus.yaml.
> Documentation/devicetree/bindings/opp/opp-v1.yaml

Even then, we can document what driver expects. So duplication isn't
an issue I think.

But this file is outdated and hasn't received an update in years.

> Remove the redundant file.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/cpufreq/cpufreq-dt.txt           | 61 -------------------
>  1 file changed, 61 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-dt.txt

Merged with this commit log instead.

commit b238cd833e3d62a76c53d540ed663b314ad179f0 (HEAD -> opp/linux-next)
Author: Frank Li <Frank.Li@nxp.com>
Date:   Wed Aug 27 16:44:01 2025 -0400

    dt-bindings: Remove outdated cpufreq-dt.txt

    The information present in this file is outdated and doesn't serve any
    purpose with the current design of the driver.

    Remove the outdated file.

    Signed-off-by: Frank Li <Frank.Li@nxp.com>
    [ Viresh: Rewrite commit log ]
    Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
