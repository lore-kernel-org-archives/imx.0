Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6061D337684
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 16:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757520613; cv=none; b=Q5yWuxsRIXuJGeyGlS91gSvTIQe6F9oZAbFhhkww+P712U1L9y9HDl5OcljZH37UJNZ5kceyv9lehbAv8BEFBSp/bv5epxpnC8y5C6U5ByvG8/0G7cdrFJT/yq53z/G1mvO0Bl52qKteUVyBtdX56LRYlgUNUesY9y1e6FUpZhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757520613; c=relaxed/simple;
	bh=4kjxrxyFEb4K37j83q9FN9IoA1DrIJqo7dm0VgzSVBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgtV4jzubxuC5jX3lUVPt4ggIBsPr6liZ9VpSwZ5HPD1hm6HvlIf6a1qfOLCOAOBl2V8ziTHAFECOfilhUnwtWDP/vkTyYeSvTIPdToVpofpHGHfXR6kjl6okERAnPgCqXaPg+7IUQlzryFROGGHx71UHBWVmjgHPLwDeLLx/Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eqXHI5Pd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eqXHI5Pd"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3dad6252eacso3248709f8f.1
        for <imx@lists.linux.dev>; Wed, 10 Sep 2025 09:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757520610; x=1758125410; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9LI6s40pwmOAvNzLobzMUKZOm00biMObXADSvvCng4=;
        b=eqXHI5PdKw3WE+T1ubmEfzyczTv/sGa2FnqggeOJmr6hdGzBZjQW8TE6dRbhzjshRN
         8VOqXkYwvQ/RvlIlGtMZlYr4NlHWtXpoDyoFRRuAkf0R7JE0TWcdWNAa+Szp4nL6sN+s
         oeSZDqUWbK1EbNnJNrWTYyu6F2qeyonsmU6ZbjXtOVX7D1bdA47OWaYpbvROdVG7Jd5h
         SnAuIBmCJHvQx0Pr+5/K6BxK3DwpmvM+VwH9VHdytyVcCXLQHGFpQEuPu+MVoPRmgij1
         vpFF3+hl0X0uEHASAIMJfGfOrZkZIxFgItfA7baPHE2ypRYAbiERHkZXAAffhCiH0FlI
         BBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757520610; x=1758125410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9LI6s40pwmOAvNzLobzMUKZOm00biMObXADSvvCng4=;
        b=G6/XSjqCOJ+bC0Iif/B84qZMs/6R4zlxT1eXFzNbNJcGZtBYFrmAnjpMy8wtCkumz6
         At1lHoAOZBHo0mXzam6Af4JLP/Qga3fDmXFMkK+FM2FXS0OHvXqfUPsgB9xOsHhOuIWj
         zD12JcyYTaTXNjPYaqtb3vE6kCOEtAi2B1oxw7n+1HAwTBCEYUVZPZVm4MEnoR9OrTmH
         DWz1VRPDBtDHy4wMUkqS4lwfQkeGTYOOa2YdLRgodpS7Mfd6xXctur2LHg/EI1oLDg5w
         6gwFAUVbTnNdktbRNVjYEkP/wn8M+efCirAwpXqJZggyNhgZAlmAcHWDj1hMEIQH5w0g
         AFrA==
X-Forwarded-Encrypted: i=1; AJvYcCVKG3D5rl9okGppVY3kLwmtU3cJ9VVgew8m5fME47bw7CwvHaZdiDh1E+q0jSsx7TfWeAc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKHRigc2oq1uOat7KXVXlE4dGqtV7sb/8UW5JyCBgQZpcc++ey
	mj2ox8LeOqix0dT50LZa5yds5wxTGBWtu2/O4jqCUICZhFkI9cr6fIP1Bruyko4UClU6jYQjHfk
	Hoop6
X-Gm-Gg: ASbGncsZJvyvNViaZkZHTG9R+psm9aHT6ycRgsXEN+JGPeU8Vpy1VbFvLXx+oTBwnbZ
	d5I5KGW+2gIOIEn1whO6CVnyqQzGsLia7wkR1tntVqfdWAoBa2toDv8NTv1YQYROhwAsCW6ioKt
	QdwJ4Tc0nkBpku9/80FqtSxOeh7yLYAmLmBeHgB4puFz1Cn6x8R9gkAXySqjFE185AaTL36yz/m
	sIoyX0cBJd+QDs8eqmWBVEoxNBNbhQmEAyLOr3SA3ZNgK+bRy2/KpmRLukdGQeoPtmZ9rsWY/wU
	njAsgs3aXdbsEt2EbDlXj0xRsx74aA84Z5HIHGGRDMBTleEfQuLx3z6T0NRUW/fiWzgGVD8fnl4
	VpUYZ3+DVoKoLoBgXodSAsKZlVg4=
X-Google-Smtp-Source: AGHT+IE9glpLlh0ZXr1YlFRw69nZiN7PdFZT9NC7CNgw6KEShDJ8T0VtMfBa/BEPa2F5bWBlMU4Tpw==
X-Received: by 2002:a5d:5d82:0:b0:3df:a0f4:abc1 with SMTP id ffacd0b85a97d-3e6438373acmr12643107f8f.29.1757520609607;
        Wed, 10 Sep 2025 09:10:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e75223885csm7320979f8f.36.2025.09.10.09.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 09:10:08 -0700 (PDT)
Date: Wed, 10 Sep 2025 19:10:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: imx: sm-misc: Dump syslog info
Message-ID: <aMGi3S2j_FHid3Sb@stanley.mountain>
References: <20250910-sm-syslog-v1-0-5b36f8f21da6@nxp.com>
 <20250910-sm-syslog-v1-2-5b36f8f21da6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-sm-syslog-v1-2-5b36f8f21da6@nxp.com>

On Wed, Sep 10, 2025 at 10:28:18PM +0800, Peng Fan wrote:
>  static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
>  {
>  	const struct scmi_handle *handle = sdev->handle;
>  	struct device_node *np = sdev->dev.of_node;
> +	struct dentry *scmi_imx_dentry;
>  	u32 src_id, flags;
>  	int ret, i, num;
>  
> @@ -98,6 +134,12 @@ static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
>  		}
>  	}
>  
> +	scmi_imx_dentry = debugfs_create_dir("scmi_imx", NULL);
> +	if (!IS_ERR(scmi_imx_dentry))
> +		debugfs_create_file("syslog", 0444, scmi_imx_dentry, &sdev->dev, &syslog_fops);

You don't need the IS_ERR() check.  If debugfs_create_dir() fails then
just pass the error pointer to debugfs_create_file(), it's fine.

regards,
dan carpenter

> +
> +	devm_add_action_or_reset(&sdev->dev, scmi_imx_misc_put, scmi_imx_dentry);
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.37.1
> 
